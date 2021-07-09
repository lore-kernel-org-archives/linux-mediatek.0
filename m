Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B450C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 06:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5AE061414
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 06:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5AE061414
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11ZfC1eO2HYSSOGwh9YHE2G6iwzOaFLAziFFl3MGhL0=; b=vc/2oaMXuVgaHT
	RzHkmUvxscFBEm168lKoFDgn/vUjqoVWy4jTZxPlzNo1SgOYJlQgTc6V8rSY2Za0agfsRIu2HQjpo
	I3vbTdLXxvrMF1QX59UCEgE+LmgyOW9zoa+2L14mS50RIAaYA4tqOloBhiAdrqg2R+ecuUkJA5xnX
	cfpfBYwmo7iaOGADlUF6xf/Ub8f93vmovZF5/4SfXwqx3NaUISvZqHdjmHIQO4ydTjgWSSSK2CA10
	/Tkc187CTLFfjJ3y7gQyJEa6PogWK/BozkVJpLVGyByWKGzb0IGNeZ0b2HlTTgxZDoiVivY7sgtHj
	56khFfUjYJ+LyBu26FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1kAv-000u3l-Kg; Fri, 09 Jul 2021 06:39:49 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1kAt-000u2s-9i
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 06:39:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id y42so21223693lfa.3
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 23:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GdbwvfH2damctRl688URppCcO8HiCSnYmA4puvxValM=;
 b=KARnKsI6wDXVlxoOJqqGBaT9Cvtu6meuaoim3L0lyRJTOtNHXTW15+lu+fX2Avc4SE
 sclUFBx2eXDhb5Ek6QXiwTQZFR7u0/lkRPCyWJj7CZ75DdaQuqELDVVUi+O3wDDsq6XB
 xaCqqW3u5S+0Z+S72yZYXwfyQ8NqtI/64qcv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GdbwvfH2damctRl688URppCcO8HiCSnYmA4puvxValM=;
 b=Aj8iTSuAXgMmXBIbogenfH+NIj2re64tbfcvZskv5uAqVrUZozfBou+ofee3Z747PC
 enz5iy7XfvqkQS9tBXkERQB+wHM+H7cmLcSbARhgWn6uKkfsa1RLvzEGi96yz0AFdw0v
 3Nmrys2sO/aMlWYbIvEaICMA9ZW5ju4BrH5I1hRszqaxqNC6+aty9FbDS9cNpDRoBtnO
 doDWzZJvYf+4eVAvhFhpSmLGr086KSehlhoQORtnRyyV5PcgYnq7C2K6UjBgYUxhhGHX
 tEfbiJafEn8AaPWjOEngH1r92yTuPqsb5WmYZys+IJbcX2oSrJJdJOckL2bjNnTlyfXt
 2z5Q==
X-Gm-Message-State: AOAM530/Ir0R5PXCGaZaj8V53ubH/nJejg3t6e2eB7W5+AA0taTyiEAi
 pyrnNehxA5RxD+CGt2/5fot9Fm1Sz1B8C9vTC1CMBA==
X-Google-Smtp-Source: ABdhPJyxfIq66PAyhcwZKY98vY9gxJePWfUzcQTs7lPlWbqVj656LIF99F/PEycna45aCaK+KtkLo7qALswN1VrtyeQ=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr27080916lfg.647.1625812785287; 
 Thu, 08 Jul 2021 23:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-13-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-13-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 14:39:34 +0800
Message-ID: <CAGXv+5Ggv1ouJfGwfk8XbTZ1c61-QU-=M1pA=VB4oJqWwE2r3A@mail.gmail.com>
Subject: Re: [PATCH 12/22] clk: mediatek: Add MT8195 scp adsp clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_233947_398608_AD618EF6 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Jun 17, 2021 at 6:59 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 scp adsp clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Same comments about commit log and Kconfig option applies.

Code looks good otherwise. Note that the datasheet I have does not include
the registers used in this driver, so I cannot confirm them.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
