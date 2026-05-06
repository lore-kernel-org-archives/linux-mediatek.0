Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79682CD3427
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 01:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=; b=V7xqQmoY+4tRwfF9VCmuW24kVJ
	/1xTXMRgGcxePY8rIATXEwVueuTT+G682P+S8og3hMmMY9J5Qit+Ak8A0oxjAh20YPhlZD5LS9TjG
	wLLVgG6wEI0f1qv7r5pHpmUBYEV9hKJMxAHFUftvJGr7XDT0XJDzeHeCoXrZ9/e3QAu3PBet/hVLQ
	f0vUNCijVIJw7QHkakgpIrQFMC1Zzd6Uor4BsWqRAXEDPXp/DVqrcvY8sMnWhu3plD/UYSWKjPJ/w
	tmS5nVhh8ygtg3yMX8Gj6C5o6NV4usKI1dbgmGUDjNtywYwDwjZlBJ6OQ3IBCXT10nuLX0Gf8CItw
	kvsJGMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQe0-00000000Msv-0EAS;
	Wed, 06 May 2026 01:01:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQdx-00000000Mrz-1eYO
	for linux-mediatek@lists.infradead.org;
	Wed, 06 May 2026 01:01:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso5661688a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 18:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778029299; cv=none;
        d=google.com; s=arc-20240605;
        b=GGwgls/z5nYKBOz6Ll8qhkz6uNrp2PDpIFlYDy2mSCuSi+7uTOKh8Xjle9lUtgMuOv
         CZvEmT5VjDeH6KGZ5wZXpP20Jy8X0/+Zql+7PrnZyhHnBf30FijzvmTcgFTKd0CtJXXp
         5fC8eKD69iPdz8aL45iqiCh9BCeEjLm2WkFO59tI+0MO3DGvqFSMAeDovjJIWVPAzdmk
         sEr8lWIVBQxFREoZIYdJkFjmQ6VrwkpdzKk6Bsn9ZcgJchhoXjffYs+qRGL7Dsl/fpLR
         GGlQ4DIskXaX5eCtEXQnGnOQhdiT890wpHYUgUnsChIJd9k98thfbTEBXwU4CN8Jc0HJ
         trlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=;
        fh=x00pz7bHVmeJ1SRSVzd2G4tntJUhc8pwBHthkNA3OCo=;
        b=VKgJzy+kq8mS++LCVglpuY4vGVYKnuFaV2DN89XABptkJvNT2aPJX4DHUJ58NtIuG5
         57xn/PnLo2WRpKWuV3fFNUrLzKtpFALAS32VST5gBggVIY4w+Vva+SmZVkzh4yc4BgSo
         bJnvVAY71QxDUCe7KV+/Sr/yH6I1F52Fxmcwy/vLtO3kmqu92AlOU+3Fui5q6IMvgz37
         /1UviflEGZHdDPVgbxBGyAFMvuIIH+H8UNc+ILin/caCZolmLaeAMteLBINwDINRMG1n
         doJw6YTBLq80FKw9rsErw1AtX3TPWHfWP0kMfaVRz/AZN/stuzlxmWGZnMfcij+N3nP8
         Cbog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778029299; x=1778634099; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=;
        b=N6TtkNpuNaR5avPYXAt/78TIIHN1YTNHZ4isFuEAKNIopInvTDsbyek8N9hG1wmE6W
         71k3WcAi3kkyFEsbOh+9LIOuFwPyC4Fok/vp5FwfaOKvGzRBMWMDohILLGTJJkWiDVkG
         qGumRYBLSec43kqWOAR/BdAAzdOcdiTKqFWdQi2M4vWEiN2prifcTS26Gmh4l/URRFLh
         WNw/Eke3t82VHZmpDYRZTBlMWR8y4o0Kf2Rmq7U5vYmMimnAomTASr9AkcFne+oFj6Ru
         Lnsbbyfa9QgItNAbdeE6LnUIHOW6gBuL8gi2mQvs8n+9e0fHe4dYPvMbgiTjGVpBNyFF
         toeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778029299; x=1778634099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=;
        b=Xk+uJ2x3mP0AvcToqCTOYeN3ifXSqKlrnwJreSJ1kjb2YSzOLj9JkZMw4I38cSGkDZ
         n6k1tAs4GAtH7TIXuO/SzaXyPsJPiTuEMFE9IHmx4Uss8YbyxjvI1oCmlkG5HkTKOSAj
         zEBKv1FtsyJiEyod3y5oU0eLzeMlBKrY5ZiICy9niEFRYNdcIWzpptjyDkfhXqmLqTF6
         lNlv4FxF4FLUEE02qX+HLwjDCwMGTXKb+ZkFN7KaII/P3I/iUk7DDOHJawoimQMIZjdC
         IBHfqx1Nac6Hns6hqDeJyUf78w+GsvV9XNVjLLXbhLbzcUak6esWMiAXUhQ8GZZHD60K
         sXFg==
X-Forwarded-Encrypted: i=1; AFNElJ9egPyc+MYHbXgx/oEdtjfjmPCafv+n0feSTj3VIgMXdKQYBVRjOeoe2sOaHClZj7D6SMd/nVpCChqmatHApQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwehstacmD7yc37SeeiHl9Z8A7hR8Oz0342LkCGTWcDDrF/mGwn
	LhKJ3AgmFU22uHt2jmsWzjawD1Y/4DGtDoEoF7e8lyRL81/svusL9hDerSx5Jj2T0BKlfQDqyEL
	aJmJgLuRE0sibA1rvCIgTqQw7pB3pzg8=
X-Gm-Gg: AeBDieu8RTiWtsA8jkILYqkngOOY23hHQPnR1JjtdH7NPxAgTQ9rSn+9dbLDNwGGMSV
	IkCNWtn7NH0T5laf3ZbT+4FlSRLjor3USEaH32PUkkokhi4VDGkLpffCmqDwWXtGzIUc5M1EpSy
	q1qmAuZ8+l8nh3LDkj/L9X45M0qxotrklahL3hal/YUFnITlZMuIcEdb3DIyCfa88NL47c8LDRR
	yXPgMQJArsw/TuaTwW/xj4hd+2uRA38DV2fDZSckDQwxHzAs2W33QWkEANItYpabVVY18Rg37iH
	juCYjzEdJ5kONyDX9XWj
X-Received: by 2002:a05:6402:561b:b0:674:74bf:8813 with SMTP id
 4fb4d7f45d1cf-67d648a2908mr225875a12.21.1778029298587; Tue, 05 May 2026
 18:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
 <20260503-mt7925-tdls-fixes-v1-1-dde847e21081@gmail.com> <CAGp9LzogKfGovfDw+=m4BkqWAakFTStXH20cQ_FA_5-zo+rmGA@mail.gmail.com>
In-Reply-To: <CAGp9LzogKfGovfDw+=m4BkqWAakFTStXH20cQ_FA_5-zo+rmGA@mail.gmail.com>
From: ElXreno <elxreno@gmail.com>
Date: Wed, 6 May 2026 04:00:00 +0300
X-Gm-Features: AVHnY4INobXxdEOMhemHPoV056iwAV8b_9YlbIjpzUDt0nGFCtcSzWUQppCzglI
Message-ID: <CAJ5_wsS1fMRvD0akfPB-FTcnk+j0pULHrzvOCgVVh1XVbmOmnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: mt76: mt792x: disable HW TX/RX encap offload to
 fix TDLS direct-link
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Soul Huang <Soul.Huang@mediatek.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_180141_727002_61310FB8 
X-CRM114-Status: UNSURE (   5.54  )
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

Hi Sean,

Thanks for the review. You're right that the global disable was too
broad. v2 scopes the fix per-TDLS-peer; rationale and changelog are in
the v2 cover letter.

Best regards,
ElXreno

