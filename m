Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C124FC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 16:05:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660172145D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 16:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EtwcaG+t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V+/+cxJ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 660172145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KpLoKgWG13Kbk6EPSRvlNGKnxEcrKPN/6r9k/hTEMHw=; b=EtwcaG+tM8jMmm3a8sd4o5ACL
	GERc6zyCUZs8O2iDJBenQJIx/WiEmRRvkIFmqx132qRqjeF5G6a79ZKcYQjlXcPgSFEH3dlGtrHZu
	5ceOJ5XpABIn+iAxXHKb/Xa+NfcH6y1gP8f6kLY7qPsUt1qFHrUkLw/QGAnz70xqsk9pduW8Jv1hE
	wWiMMxTtXHbkpqXthOSRnxMcezPKC91bLI1uk3iFYOftAj6/cP/rafrfrUnKwFB++cqDhgfoBqybN
	rITmjOaTeS9To4Rz1eNKB7LZ8S1Ve3SS1xOOhnokc8D+JoSJjvd3YB6wFh/DuC4zu0BYbAVvy2qBd
	6vYmj61hA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFJeS-0001eM-M2; Mon, 07 Sep 2020 16:05:52 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFJeQ-0001d4-FM
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 16:05:51 +0000
Received: by mail-il1-x144.google.com with SMTP id b17so12905312ilh.4
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YNH7orOHt08+yKQJLjaMtOTfyyp0xF6Fs1etZL+bHo=;
 b=V+/+cxJ23jlTHZSidq42rKHPp74ha5NEqxBN/sAaIX0NzKXxvRR3DCaTk2LL6w69vX
 hp5dk3EcV6CyVydHsSCgL9GkxgMgaKzHVf8naeiZiz/RkVdtAW7CS/EzUO5rYvpKTQ7d
 Iq/n3cjiz8XIiwEAmilNEQzhUGBq/TScPvJ2cScLfCMtY1PoIhpgOEyO3/OP9f5mqNhY
 gjp08yumv3i0LiNqXGmmzfqRvFdbRiRm3Wfpgn9cgn4XBkeIGKM5pYLbGLTSawomKagx
 QKQAZQduXFR9PMaAnPFn1qFTOp/KeSZYOHwK6RIqyNIqXXREmFTFsnmioNSiz/JFtWKM
 r6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YNH7orOHt08+yKQJLjaMtOTfyyp0xF6Fs1etZL+bHo=;
 b=lnR5DL12ezv7fJAPDwkJZ+jbazMwinRcwCMXjDk4J5PLii5xLF1W4RERG3XKXn9T9q
 jGL0e3HRim7GKz3eysdvBI88H6Pg4ub8RRHMB+kTp9sGVLlWeKcDlt1EFgQ71RBWzh2e
 XtbGoNzaXvpoZGMhAoj2apOjrKuSoJwFUyL36vih4Yq7H+72mCp3iIR7qV267F3OtOtO
 hE1zE4Zd3Z92K8FlWfQ/QgPQ5P7NHRxkdpXl8jVQLRFQ3ZOnc+AepH+1tpBQnGQMs5AS
 L1cKPhrLqMH+0PEQbmxOjKcbMHaXau/m/QcmwcTjaT/1eAS8hSGmo3CiOOnRMqxXSbpE
 W3Xg==
X-Gm-Message-State: AOAM530WtBqbHqOeG85MI5x+pq4vbKFfbxdF3CEhWX6hsWhfpx0J9WzZ
 OFJqurYZQrW2ZySI8civqKIHPVz3noU/bjRoOeY8qg==
X-Google-Smtp-Source: ABdhPJy1SJ48pTuQ4hoOcMXqVi7KI0IYuGLLgOn6zubuNITr+5WPd1s2pbjpICAVAqJk1uA+zLCZu2U0jMg9eNYqPDM=
X-Received: by 2002:a92:d144:: with SMTP id t4mr8930571ilg.88.1599494747757;
 Mon, 07 Sep 2020 09:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200907125646.1946282-1-fparent@baylibre.com>
 <CAAOTY_9HYvxEygv-oz9wf+JjiSfp+Zn1u5okMftz3SncfK0G5A@mail.gmail.com>
In-Reply-To: <CAAOTY_9HYvxEygv-oz9wf+JjiSfp+Zn1u5okMftz3SncfK0G5A@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Mon, 7 Sep 2020 18:05:35 +0200
Message-ID: <CAOwMV_xEEt+m+LuL_3dF2J8rp4m4gn2T8AR5nGLi0sDoiOC=RQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: add bindings for MT8167
 clocks
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_120550_540301_FF2CBC22 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: DTML <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 masahiroy@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 macpaul.lin@mediatek.com, mtk01761 <wendell.lin@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, mars.cheng@mediatek.com,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Kuang,

> Why don't you add compatible of "mediatek,mt8167-mmsys"?

I forgot to remove 'mmsys' from the commit message. I decided to add
the documentation as part of the series that add support for MT8167 to
drivers/soc/mediatek/mtk-mmsys.c.

If you think it would be better to document it here I can add the
bindings in the V2.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
