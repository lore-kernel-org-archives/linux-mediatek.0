Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C32BC5DF7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=; b=uLb2rmp3UhNT/4iDWka1anhQN0
	6pZlJx4MezV1Rdrct2nFfTIN2LaBfgDDhQz38/Ojxux2QRCj5YWHHyDLYcvZxi4hTJwFbYtevpOuM
	Kj/WWROOxxOXM9Ch46mfK0fdoyty3SxWBoy1POWNHE39AUDlOsTheoqqOeYYKN3Cj9Y0BYzAtVET2
	hjkFdIGiGa/PmY3iT8qABMospUGNTLT8g9NruRnwh13MBU7LRX275L+VI0U9ctVFJr/9Dtylc0Eke
	dIL+otMYXVspbsfhXbLc73bceaUooDOcdx6F0nOtR7mtJJKoiPtAFCvOdSLXMQMdqHTzb868iw3iZ
	mHjnknIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHdM-00000007oGQ-3pUV;
	Tue, 18 Aug 2026 11:05:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHdK-00000007oEl-2Yya
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 11:05:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ceb096e675so50393765ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2026 04:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787051129; cv=none;
        d=google.com; s=arc-20260327;
        b=F1IdRu2AqAwG58irybqodt2eKX9x4coqjzDeGvyJi+fchM21o5fb/ZHtpQwPZyiCYX
         GxIeAqQ3+8LCmdB8cGXwKJxH6p5yiWTB59aio2KRkXNuvG4VUigKLCrbdCJqsp9Vbq5u
         ca1K35KY6v/Rh87nUrk8taWLmMs1Cj2aqeAoIxzFgwSW0fSwbaPzmQVV3A6yt0fJcVtq
         9LaRYTCrUjyj2jV9DJP7aq/NM5I3T2yEc+l5ctXtLdi9NzTKIjjvxyUs6KeLcT7GOOpR
         LOsKDu/NQQ++ctsauybGSVU0xS4599LmJfty/QsDuJj6dBrwM3ZuwhOdn/FjYQlbKlij
         qVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        fh=B/mctC3J35PeIdfN+0ce5wAazB08BuQT2wc2fSbM3/k=;
        b=Xiy6pjmpdikr7LvMITGLumI2vWEj/ljR80CRwZcUO2GTLv/Yyznk1+/XH7iJvGldQK
         kPVyuHpSxOQMKYDTnRDUzh3xiTfmlpzxz/FKZ7Zui/9NymNLdK1wxR3XS7XQeMW2X310
         Uat5ag3UoOkxETic1j7ApOao0Jqu0TvL+MrPeRas69ojyH2BqGJfiA8dt6adb2tD2J5V
         mLdWD4mvYq1DmrDplimpeUS4T/AxVt0JBmY61kzDN0Xd2WQ8TEy+fqylSGTISUhVY8wq
         +ppsqnxnhZGHffdttc5Lwc2vX7fS0Cbjqb2hx4JikFYORVuhIEzW4WUYWEWpPG+Kr4XJ
         goJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787051129; x=1787655929; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        b=XVdoawZqCFaOS+c1+UqOwI6AzBTJp1YK4KjOznbc7vgHt7YGTgcitkaBNC7P9VXQ+9
         BtDu2fYVPq1Kg2YuAhyDVJym5vrK0MtPjw2KJWyhJWejRuG2PrQsGbbOHcoe/jtz1rFv
         OULYwv6lc1L0q95H5L1LL8YQa3Pv/DUbRtz5+Pq5l/MCalJj9Bvews8rN05FxjqUva9e
         5cNUgNOq8Td1eUxjy+2V2QSCut+yg9CXRpbvqrllZ2isDh0Dcy6rkC5nc455GcrmsUB/
         wN9rYPUCg/KNBdjxOggvMG794e06BF0Yw33ARmq5XAYmePzWMBoUysCDqc9SaEewgh+l
         bkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051129; x=1787655929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        b=ctUYEdvIvzh29Zghr2KB52/Wb0EnonhoD0eWtOWIoiWD67me3WimeZJ30R1zsnuUb3
         10k27yYVI06Enl3dxd7IQKAOajS9cbC+WJWEHVZacl1tPZMKEaTaYFz4y6Vvq3ahhrcL
         ypKoIBfVylrUAmYhJoGKgs1gDjJ09fIoNdl0LXfsbUoK57J2+5BM1jXsujk8NEuFXINJ
         z0fA3VqhpehdXITw8u2uUnJTEXxBn8gqTCAf/SOGrD/V3vJMiqqJjN2r8QyclB5axzd1
         nWNXb7VbiPMzPS9H+Zq/R7p2BVpumgzQPv6C8SrH0ReXyjyq0PlHz3D4yWeJK5c8+IgU
         QG7g==
X-Forwarded-Encrypted: i=1; AHgh+RpBoPIKCbpW9j3SwltBwQnrF9K/ILeaXFLlh1HB2/6fNWCdtoytPGN28WIjz+WhURVTnQLkZRVLWhD2r6W2NA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqmLfaLOJr8HAK/PfNqCHj6my0+oRqAh53lhDNJlO0F0CVq55q
	kL2+UehW7mAeNPe1IdB9Tl14kMUdSB1yP1x5Famwhj3vkpUqoLjbNR8HiOgtHQTUKf/Fl0CK7A1
	e3omefqu0vqzW2Nw6KkTt7ZH1dTuzvp4=
X-Gm-Gg: AR+sD13WKW1sn3bTFj70KMuTiQiwKqtL5J/oEX1QRRmXACco5lSyFi7zMJDeJ/GNlJG
	/wA1Gi4P6ay2xQ5fT0L45lRMhpr5Us4a4h8hCo9vQp688uZPNkYel3Ss60Go2gHPDhIb0fmoCmt
	1GiryI3bifcPdB8mkKWcLbLjWCXu0FQNrrLPE0fIMb4Vaj5J1h/G86Ck5/ow18GRZ1bKJWla4ze
	2F0lU2kT2XeUQpv/WV/OaP5e+mP+VGSyvB7QAMCJEkwm0DXRGN+tcGI5zzAmeRF6jnaIxQVWirK
	WZ9YyEaerAf0aV4I/xI0xw//+srOwMfk5/1QhoO83XSvIDgbYQg3LVKPHe4f00Fe4kKpAn3hyut
	8EwNR6qN5EbIezSe3bTSbGWew562B7SeszBNjRdYRu+PN0MIfzXVvLKnFn6gP62UX2Y61
X-Received: by 2002:a17:902:ebc5:b0:2ce:93a3:c16c with SMTP id
 d9443c01a7336-2d3b0c67d8fmr411073255ad.12.1787051129625; Tue, 18 Aug 2026
 04:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260817113249.69252-1-phucduc.bui@gmail.com> <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
In-Reply-To: <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 18:05:17 +0700
X-Gm-Features: AcwNN1VRMmNaNH1aGeRP_HutF8udUVlQulWPHS_o-R-KQv4XRkLCKBfpTC2ozPY
Message-ID: <CAABR9nFdeXvEM9zVKWN4o3-fX00tzZz-YOoGo492yUJ_ZPJ5ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code
 in enable_clock
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_040530_659799_EA7F51B0 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Cezary,

Thank you for your review.

> Aside from my comment regarding mt2701, this mt6797 series should have
> its title updated:
>
>         ASoC: mediatek: mt6797:
>

I checked the git log and followed the titles used by previous commits.
However, I will update the titles as you suggested.

Best regards,
Phuc

