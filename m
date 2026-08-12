Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB43C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2026 01:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=st3PA4rMKmSdQCpBKGXISTJ37lNdsPli6gx+o+ezt7c=; b=Q8Vwn4ynvueVV+mCWMJfOlapP8
	e2BQzrKOvgi+QCqUnfUWGtP/g/ZUEFeL8Kl9qne+iEXyWCIo9jsrh1l7N8R4Vj/Es8sys8V3mAxr5
	eVy+EHb9dtnL04er1dC1W3YwTTl/S3x8qzcD9Pzo6M5r3g81htcDjeG/kbAEIVaHBpL9/OPeMarws
	52ZOIu6R3udGXX6rzjA0xkQvVt1Pe4kc2ZqCU6eJrWjC4XjURbODRt2+YdePexf8gT/cBPq0xCI+/
	sp12NqnaphvOpGfdhjIS+k31dKf9IxEjgXQDW6bVTF/KjeAumJ/S+CvAkGgMjwBb/XozR9CuAuDkc
	WQWy5FBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxZD-0000000FC6A-0A4n;
	Wed, 12 Aug 2026 01:15:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxZ9-0000000FC5c-0A1Z
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Aug 2026 01:15:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1f5208b38dso80241566b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 18:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786497333; cv=none;
        d=google.com; s=arc-20260327;
        b=TyCWDP7a02MB0S2JHKgj90Q7UAy33nJsmgigqZO5aND+v2Wwcf+MsT0B9A6UQt77/T
         KYC/wLCAquwXHYwVdDuaqu8lk7t5JLCHbFZMeEBueOdd0PxTSDQassekWJbzPknAWoKE
         Bi5ogo5RHlNvFHTRFJ1LD2eEC3LJi2bDc4UGy2NJilTmpMCNRQ3Nkzh/+ypy3nio5OAN
         kQIUblEC1SYDbVDPPxrLYRQZblKwQQHGs/6efX54NqD00LMTH5zNFteVw1F7j5pHdXsl
         WL79qGrk2OeNybiWeIWgMarSzDGQtZ8tt60yP2TNlkJgAJrzgSGNyBpeAZKcQd/m3tis
         Mvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=st3PA4rMKmSdQCpBKGXISTJ37lNdsPli6gx+o+ezt7c=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=XR3ifCrFf0lKpHT2c+tcez60njlbte2IcJtobTOke5pHtN8S75DUyHf03UWgS7vKHD
         5WJZGSC2tVtlClIBEMftyURGCxmenVUyq/koWZwbgIoaV28WqpdlmSB2OuSG48pjZqGz
         HO/C5hAgx92ps8MTpotiUdke6EudJjn2YrHqKw6Jcl8cfohklV6+sGhDbzyAmMqFuHwB
         e1ITcKkCVHRFVJTBR0ese86LoGOJA4QaVwyXmLN8dJIDrP4AWFhfwXCmC7psSaC76r/6
         +IuiJt+u4+4OtlAUfCMP2btxGgDUJbcNjf8LXMr4eKAAkA42gATG0FWHDKfdvn1eljrN
         py2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786497333; x=1787102133; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=st3PA4rMKmSdQCpBKGXISTJ37lNdsPli6gx+o+ezt7c=;
        b=DfbyBhytmJfo8JrEhcezW3Sxb3FBWkqzNK8TvqWs+bmdXjNjVsypBFtzSQcQz+q9AN
         8pTO4CjXjqUnWnLW4G+qGKP9q4GYg2H/T/1eLvjjUmDkbRLNjaQBHPJrd/2eOdHtHUP3
         /Zd7X1q0vKcP2RB3oZDwkteGS9nVfzqoZw8SU8EA7yXEfDz8qXHagtolC17kXLvuKsVT
         OqgppOi1pPJvGECkD385hoL7yP63PyOgBtr5MeCnhE2unoql/FXMYLsO2+Tq0TlfaOmO
         fidYsSKmxzAUxlByTx8+MvKsWeWGY+Aa0MGrQphQ6RrIz3gaH7Zr8P/U1BkZEjv4KHNd
         mmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786497333; x=1787102133;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st3PA4rMKmSdQCpBKGXISTJ37lNdsPli6gx+o+ezt7c=;
        b=TMWFb4/G8xGyGq+MHq7PsJSFbViS+PhDl3oPu2Z6CyfdOLQnC/Hl9c5hx+lt4iuQaE
         ddEDsIbDH8q5CXr6bX36aMlqLBqVExYuS6rUzIdbYq0TTNOHQuVxwvdEruTIxaar6D8P
         26uZ2WVUw3MXQPgUHkf4noKmANqF+hvK1gJ42AbNKADLqcwhsoHH5Zy5owNZBZm8U9D1
         iy9OB/jvD6XpW5tO/y5CDni5I/Ae11joInvi5+gLEyCcIvfTSneTlCzkLAwEbTZyrk6p
         LFAWmYAVzLmweptqVuUqfLqP3M2g6kVqzwWAriF69MXMNj/Dx9cVNRDtio5DexQQNC0O
         cb8Q==
X-Gm-Message-State: AOJu0Yzb6QdLyV/DcLDXx+lYAIsnHaGzl0gdN2pApo1URnv6sVhzOO8v
	iyWlGxEBWzJf4Coi4ZqbTHUdMBst429kaHnhsa4lt89k+bCWLqv7r7Pj5W0GKX2UNk8wXLE0E+v
	F9IwjB0bs+XDtm5Jm/8gNeSR3Y7FVA0Xtzqq+a+Y=
X-Gm-Gg: AR+sD12lWAmTiMp9CVI4Y2MV9rT+6PeAzXWdF7wVGLkFMwPrtFaXyR/6uXQ7VomCJe3
	6f+6lZgbzeMmjrNQ58Tm7z+40K29cmnITFkq6HlIye6mmMY4LFAYjaStfQF9uevKeDnb3p8c/vv
	ckTP/c/m/7ynNjR655fxhjkHGplw6kgkdFyeL3OXwg20V26jTUdCiepTWd1MD2GQ5nlBbRe+Ziy
	yc510SFgqioyuWGw+2D3zG494lquAKdg0cKfbsrj4aFC+0ZRKMPcTkFyac6GjF8F7FyBmKPXXdb
	sq4SYa7EVVh/wAKWAbMe9LdmZ/ABhNJxuXx10C06bLPn+C990F7JLHdstMy0PifDibvr5uRZRlu
	c
X-Received: by 2002:a17:906:fe03:b0:c16:8799:fcb4 with SMTP id
 a640c23a62f3a-c20f3080468mr57761966b.19.1786497332474; Tue, 11 Aug 2026
 18:15:32 -0700 (PDT)
MIME-Version: 1.0
From: Greentwip <greentwip@gmail.com>
Date: Tue, 11 Aug 2026 19:15:21 -0600
X-Gm-Features: AUfX_mxsjGGi0_exYaJxn3FeahrgoSZOfB-laC4bK3I_QCB_GrkM_HaQ_yJVhII
Message-ID: <CAGswFt6yJ+u2Wr8DprcS1Fd5-LkwgJDnOUKC84hNmsCogCAKDw@mail.gmail.com>
Subject: Samsung, Xperia, Oppo and related MediaTek 6592 drivers
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_181535_269486_FBC7E6F1 
X-CRM114-Status: UNSURE (   6.73  )
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

Hi,

We just wrote the first drivers for those devices.

They were extremely complicated to write, MediaTek gave support and
documentation, and we're mostly ready to submit patches, caveats is
that Google might not be happy with it, asides from the fact that they
were mad we open sourced our own work.

Lastly, let's finish the integration, we have an affordable gaming
console that is also a PC station with Debian and our gui frontend, I
can't fight the Sun as it seems, and all the scolding Torvalds has
done while I have been working at Intel, and when working at Microsoft
has been for a good reason, so I apologise for not following his
advice. It's illogical to follow a route that won't benefit everyone,
that is not supported, and that is not community available.

I hope you have an incredible week.

Best regards.

- Victor
Cybertwip

