Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD43E7C4E8
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 18:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9iYrjHOyfOKIUcVEs2UDJbgeqtyssNJDxi1mGLZrX4=; b=3GG0dcKIpQm665LpL/h3xXLQlK
	CALU9I8dGXDHGZV9j8nHNbPe0KbOS8fLHJN+DKsK1pnovafEutK9jW8qV/y3g0PlRhhzbb1KMyk1T
	h5QoMAoPHC0oBRZ76x7a4QVzeC1o036XNTUkaMoRM23kJPMLbkLl2gG+mQ8g2jQVxrnFKU0GbRi4C
	m6HVWrGCN+AO3316y15xbQ4STsXYRrOip04q+xSaHTAmucyeNBnvXPvyccULmo10j/rPyotVlVd2s
	vGjZC9GYBPXTcmCxSDVeL8xpe9X5ChbTa3pSjBZw6QWH3sakDx+oh6kdLxIoZvsKcYaES3asRF79Y
	r6DPk70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6Ij-000fEj-17;
	Wed, 04 Oct 2023 18:08:49 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6Ig-000fDE-28
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 18:08:48 +0000
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-690d8c05784so54639b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 11:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696442917; x=1697047717;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9iYrjHOyfOKIUcVEs2UDJbgeqtyssNJDxi1mGLZrX4=;
        b=GciZoGuS7kFfewFVB3cknOQq7ySSnXzwvexAHUR6srSYgHOCeuRXpaTYHHCaS9csxa
         loP0ze2FPIEE2Npft6dwfsWax+qLvo+w0HQQ5ncmc0p3hmYvE8lxJQEfgkz/EQvgDjOl
         9XI4im0TvS2KUQv6Q8AKC2RM7JbbTMzsTFl20FzZJQwnFyTX08MY9/hSOJXfkY6xvdVU
         frCgoLXBJXfYA8f540dyrJrsj5Lc7omOgGZQIiHqPj3AqvZCG6OqB5L+X/xhDqQEUE1p
         79ZrQ3WBG4gqGwHur3HERHLODCArsLrwMlIl5RGdoT2oc2BKu+he2c6FqXsVsYL6Qzo6
         0lhQ==
X-Gm-Message-State: AOJu0Yzg/T4i/qBvemSWEy0MUsXlZIPZyXzbHi4AuhexTeI47VTU+8kQ
	LAUd7n+LJomZniiPLQg8hDM34Q==
X-Google-Smtp-Source: AGHT+IGChQBN+ORe86zQsRfP8sgNZXca4nlpKZuqOVrZVMZJgmrdlPzT30mCpFbTG7lG/oc9xpYLPQ==
X-Received: by 2002:a05:6a20:431c:b0:136:ea0e:d23 with SMTP id h28-20020a056a20431c00b00136ea0e0d23mr3578146pzk.11.1696442917014;
        Wed, 04 Oct 2023 11:08:37 -0700 (PDT)
Received: from localhost (71-212-56-62.tukw.qwest.net. [71.212.56.62])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902ea8200b001c62d63b817sm4016430plb.179.2023.10.04.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 11:08:36 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: nfraprado@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 robh@kernel.org, amergnat@baylibre.com, arnd@arndb.de, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
In-Reply-To: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
Date: Wed, 04 Oct 2023 11:08:36 -0700
Message-ID: <7h8r8i5kgr.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_110846_695102_46AC5F72 
X-CRM114-Status: GOOD (  10.51  )
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

AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> writes:

> I am a top reviewer mainly for MediaTek SoC related patches in most
> subsystems and I've also been upstreaming both improvements, fixes
> and new drivers and devicetrees when required.
>
> The MediaTek scene saw a generous increase in number of patches that
> are sent to the lists every week, increasing the amount of required
> efforts to maintain the MTK bits overall, and we will possibly see
> even more of that.
>
> For this reason, and also because of suggestions and encouragement
> coming from the community, I'm stepping up to be a co-maintainer of
> MediaTek SoCs support.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Thank you Matthias for all the work you've put in over the years to
maintain MTK SoCs, and thank you to Angelo for stepping up to help as
the volume of maintainer work is increasing.

Kevin

