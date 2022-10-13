Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8925CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBIipLVwGqXkiEUZQ0s+UwY/gG3UoitI2iMvUcuVF4A=; b=Q4hndz1CN4fzlvxKiznLX9+sn3
	xtUw6qQ8KSzgLDjnvoNEd03a500aUHKp5cIpEosb6aFObq/fBMjdhcbSZFjmhKUuQ4UztS2TVtL5Y
	TKtURWi0WduBpazGHP8ls2Dn4go5g7D7NYIfoYoY92d0BurjCW7krRlHss+MbFiMMPU4zQVlrC7Sa
	EFDEF/tZJhmf+I9RhiPz3jQTe/dqEqZVsd/1rxPMCFYniaZFpJ1IN4j/uR0nhCkxCuBKn1ekYAqzK
	RNFmEE6Dw4xjhqIVasbsvguxCn0LjfIe/w+6SuRHQPWaMhcH+cXRKGl4yF0rT36Tbmk6IRl9GasG7
	Emaru7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oizcI-00CCmx-F0; Thu, 13 Oct 2022 14:55:22 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oizcG-00CCmY-5I
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 14:55:21 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-35711e5a5ceso19597947b3.13
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Oct 2022 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBIipLVwGqXkiEUZQ0s+UwY/gG3UoitI2iMvUcuVF4A=;
        b=DPxu1EFsYJmUM6rlny57ruFeEaLOyabjkouRzlDJSiXihniPrPGDCGB6u++m4Rmyl9
         zO39ED8BUIW8zC96c8hyvkbqWLZ3L+BSD6QkBjXaDDnozaU+0jM2Qo1J+UdeD0WldpEW
         7jLH+V5/ZIXp0U2ljbahLokEdNV7KAr0s08Ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBIipLVwGqXkiEUZQ0s+UwY/gG3UoitI2iMvUcuVF4A=;
        b=xenG7APAyMDZ260nEcuwn+RVGCqYVSivY51hRiZrVC4aSoiVDcqeAPI9vREWie9sLO
         unCofYSCfLgUFMljpMPcmspCVsT3UM+ysHzDHpxSwg31crBBNWcRQ3EbM1JU1rs9jWiZ
         i5I+Im4ht7vSh14mVr3ZuF7DGyqnlyH1wXUtSTcSvOHrQ4puPLHww7DkNaYT9tmEf+fb
         xg8iwGomoWd/GDf+YAYYhOV3hwRP4DTaw9g3+54rEGQwJkCXfgZUL5IoPgd4zkgAwapy
         x5DdCUyF3fjA9YqPhhDmzvznN5HrvOfMTWtcX2wuOJfZnez5Fm06UFujyIXoXsIicC+T
         tsQw==
X-Gm-Message-State: ACrzQf2MsA8pBmLR8gY1mgPnukZhUPQJsUjqxN9GjpOgWo2SIiK0sbSt
	djGDbmVLrzUeL9GoCDxoHeRVXESKKPdrOD087aZ+VA==
X-Google-Smtp-Source: AMsMyM45MZhNQj1zqmzswA00CgfLvl+B+vI9SGLc1NFzKu9waJhjgZ6CIjvEkueQQUKTlClnpCRd9Wrrc8KZjl5Hhdk=
X-Received: by 2002:a81:2544:0:b0:360:c270:15a1 with SMTP id
 l65-20020a812544000000b00360c27015a1mr329324ywl.67.1665672918017; Thu, 13 Oct
 2022 07:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221012191226.1646315-1-greenjustin@chromium.org> <CAPj87rPftXR6v=Z44Y7EKkF2w6Hh_sEueW_m0z1qmi0iH+moHw@mail.gmail.com>
In-Reply-To: <CAPj87rPftXR6v=Z44Y7EKkF2w6Hh_sEueW_m0z1qmi0iH+moHw@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 13 Oct 2022 10:55:07 -0400
Message-ID: <CAHC42Rcx7TC9R6zQyd4NWuwgm89ReS6X8bbLKR73CjcdfWjHPw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_075520_256171_78EF7EB7 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for the comments everyone! I'll upload a new CL sometime today.

I did want to ask though, I realize I should be using u32/u64 for
kernel code in general, but the rest of this file seems to be written
using unsigned int/unsigned long long. In this circumstance, does
keeping with the style of the original source take precedence over
general style guidelines, or vice versa?

