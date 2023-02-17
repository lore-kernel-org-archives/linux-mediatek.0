Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C8DC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khYUeXPrSaACLyO7uuI0hTSia/FS90YP+QaX0EK1f8E=; b=mFoGDKLwVZte0vPmb369mksEAI
	Dh03CVcVU6Ksq5t0RNubz89/khj+Ssqga7Xfs2qZpDkDMFOqUoZIUV+z68e1r4RzQeADS2rt4aqcR
	rNRr98dfGHz0QU5/Gf86gD22z6knngQQo62BrAmk08Pup9o59qXyCwPsfHgNOm+5SUwCkJPBOz+eH
	s39HHXHY3CE+6/+uZP+ahkuZrdFSY/SNlKvzdpskZ3q8UpECbSHiv87Kd050pEtSfZmdzW8HGB+u5
	RtuHw2xCvlKrD1PCU79C6Wm+qV4nxTrSOchmr8RMO1j8AJO/cVn6xoc1RS4MEI6/gGYLAiODw7BZu
	GGg5Xf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs6i-00CZoG-En; Fri, 17 Feb 2023 04:12:24 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs6X-00CZkH-K0
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:12:14 +0000
Received: by mail-vs1-xe30.google.com with SMTP id d66so4291063vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=khYUeXPrSaACLyO7uuI0hTSia/FS90YP+QaX0EK1f8E=;
        b=KQjAOl0W735TB7cqm8bxPQGwfcUz3MsFGOO0QYejWnPkHM0jmCPg0vW9O+h7tkIpDF
         1cCT7ATb1VEm5BqNohdxSaaTSxCOurOvUwPQq/RwaRLt4niM7/ifA+BZwlvzTPeQ4tdO
         GTtYLPHlTkHKoWLvvx+358XlBEAkDdsPD0KNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khYUeXPrSaACLyO7uuI0hTSia/FS90YP+QaX0EK1f8E=;
        b=Qll3dF/AD1XFNX1JIFug8ttSkr1KcBbwVRiGi14zMpRNoF7/Qs/kjzFDbDUb6LnsJ4
         3F0F3NZBTojY2+Dkhp5ie7TVMQCoqfathIhRCf5K9VJBISzhBsGEsxNyu9X18ErMvfW1
         cCcQ+oxBLjIec3pXHjjTdh9MxnhpF8jp9P7mX8PTAcFhfClnvn1O3/QoF4XQ8sGOpeWy
         STlFce4syRW/dH3dnez8hpf5ZBrcR+cKX2iAvY7dbub4dZHqlMvmL5dFF5FFFiTxxBlj
         VbA226Rk6xbY+TnH9ONV4mMsUzLDbvchlZKAmx0/EMrFbIcD5Ee/WDrWQ2v/8Ml4yIm2
         ooig==
X-Gm-Message-State: AO0yUKWhuL5sxlzUhFQJYZxw1Po5FwrC/gUI1WgQp9XTQLjHgaevjmm+
	HrLkFTOseRtlSXIK4Kw/GBIve8fM0c8mHxVfyZ9ymg==
X-Google-Smtp-Source: AK7set/sHqw0F0KAlUssNSjqDO4mAX2C1vW3h2bJP5i6XlLsaFKqnO80PlYSXGZZLDvz4XXG6wfbSGjLay4IOoiera8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1525298vso.60.1676607131719; Thu, 16 Feb
 2023 20:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-33-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-33-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:12:00 +0800
Message-ID: <CAGXv+5F5KxA_3jtbgXfat1xSL79_k+W7kzpiOZmGHyEM3fnSkQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/47] clk: mediatek: mt7986-eth: Migrate to common
 probe mechanism
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_201213_679609_FA17CD9E 
X-CRM114-Status: UNSURE (   7.06  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert this driver to use the common mtk_clk_simple_probe() mechanism.
> While at it, also remove __initconst annotations (as these structures
> are used also at runtime).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Git really doesn't produce good diffs on these large rewrites *sigh*.

