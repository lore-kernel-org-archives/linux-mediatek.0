Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85B7FF885E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91hMEBpF69oLnRNrnD3g7Le9m7vY7PSSwV7tbTwrzn4=; b=Te+9VL19CuUy/FoHUWjwlZPXtr
	6i6VEgl9v9aVKQbWkrmvVcyVr/eeiJ0oe9UaeMrVyhLKHGA04Ri4uf2CuJj7f7916BXojOmWu2oNm
	1tyi/Lt+ftxlGl+h0MHPUTp6MjkSZVk0qhj3uEmjMXURwV45W8MD3kyCoFAKFWgKMRKRnrC5qhsrL
	360DofC426tciXtSwPimf0y61zNYR09rmOSTbjZlDysSIY1ITLA98EuIbA07d3UufNnCZdsK+R2l2
	KOKckXU9AqrsMn0J74IO5aw/NmnS9p5iSZATVTJZQaJCOmOU3OEu7t5PvCfj08llnowxa9KPXYlyY
	dVoOVqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHRq-0000000GTkM-2tHS;
	Mon, 27 Apr 2026 08:36:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHRp-0000000GTjl-147y
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 08:36:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4890098abbaso78116185e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777278967; x=1777883767; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=91hMEBpF69oLnRNrnD3g7Le9m7vY7PSSwV7tbTwrzn4=;
        b=ZpJbsCFix1N7qwAscdS6e/S48YOUp8GWjawp9YHm87j90oE12nU1igjj2Ec9b7MdVs
         8tM9urWFY0R1k81UIDp+ycQS45M3PzNTxf1uB7m/KTg5hTW9RIGawbTG7GH7/I39JeOu
         caMm3OHVy3nzYfyx51miz3CgLlMAIooN981psMAHpwtn79dQme9lJaixPKNvZgtCCzTu
         6eco04SSzz76kkSrbfZsWin8Zahtnxu83nMKvsXFr1gRnyirlOpR93/5QdeI010bWN/L
         ZS4gvZOugRZ8AIgu73YnhyBz6Nd//Ia5bC8fB/nC+Yf9NFENYqzc3TLDLtLObxvqM22C
         JmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278967; x=1777883767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91hMEBpF69oLnRNrnD3g7Le9m7vY7PSSwV7tbTwrzn4=;
        b=Q+21qi9pijBHX42uEn9xI9ovXIkXgp3TgLmHowwXtJyqRKeUDfRqMXIBv7VPbozKOT
         Rtc1QmtCxIQO+HeEM0GG4bZY90U1e0N2jLuptr1xsTlMAbGrIjOUS9Nrn4Yz9NsZj36S
         W9hovwQMJnmbjscxAmEzhP0HLAs+mk1IRxiK1mEfgKhrkVEiR2/NB+W2YOZRfxs5Ar+Y
         q1rzRzfLsHaxfuE1udR3wCUCt4UNA3Cpq6TECKC0FzYAUax2K8HzNXKNiijQ72MawK8z
         XCOSBEXruzuLnjQCSBZKI417zOWEe9qQPTWkzwAqKYHjU3LxUxFyVJWmTtNzYB8C3/ec
         PLWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dkc4MnG1fNoTw2IBaK4owwy+fwfzt7f0LMF5rOmKcOL7l0n+BgJiLebapRxkPBJRB++5zZojSeVFUMXthqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKrxHrrXYeFiRH8ukAjkj/jfz6t/kRQXdYEiSuScu4FzRcrbW7
	CHgZ9g6SuBwv8gtvw/JAFSwZLISPDTrjhcUdYwmCvCAQmrKKy4SPxDxE
X-Gm-Gg: AeBDietZ2aV1wfXlhkjFRnNMQImdQBkFMB56KKByN0C0HsHwhL2TlgOgkS/v529gMZZ
	bdhftezDAlu3wMvUt3uHnWuOIl1jDCj08vq+HSe50k7jK+iVKFHGUFzPUH5i9iQKgfFQ2saIRC3
	r/s91UKCX93yuco9w0JWCzJJh2G6OHuf90boUq+d+9iW8OCHAgpDpN4cuuJKvzfuhAPlK0I4sfJ
	vodTdWvsEI6olih5hoKgDQ06Hl/l4ctN8Jl2FVxOM1eRGGzmyIx8/Fntb3MMTC6chGIgPRHone3
	FTR5AqEadO0DcNNc/XLpLDplxEMtQeV74qLaE86EIEXPo0HIooT0s40O/JZZqz0j1cPntOiqFVM
	b3YnV1C54SngmtHjyRa6fiz4gROJ087C9LxGTp0fwLkWTGsWJ1y2QzFTWaeHp+N7qGoibPyn5Ad
	lRpqCDkdKugArRi03gGIS2V3qo2dqipUmIF+Z0
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488fb73aa3bmr605203715e9.3.1777278966523;
        Mon, 27 Apr 2026 01:36:06 -0700 (PDT)
Received: from [10.176.237.185] ([137.201.254.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm90573903f8f.20.2026.04.27.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:36:06 -0700 (PDT)
Message-ID: <d7eb5958dcf2a27738973b0c876308a8d34ea47a.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: core: Introduce function
 ufshcd_query_attr_qword()
From: Bean Huo <huobean@gmail.com>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Ram Kumar Dwivedi
 <ram.dwivedi@oss.qualcomm.com>, Zhongqiu Han
 <zhongqiu.han@oss.qualcomm.com>, Huan Tang <tanghuan@vivo.com>, Daniel Lee
 <chullee@google.com>, Liu Song <liu.song13@zte.com.cn>, vamshi gajjela
 <vamshigajjela@google.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, open
 list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
Date: Mon, 27 Apr 2026 10:36:03 +0200
In-Reply-To: <20260424151420.111675-2-can.guo@oss.qualcomm.com>
References: <20260424151420.111675-1-can.guo@oss.qualcomm.com>
	 <20260424151420.111675-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_013609_299340_48FD80F5 
X-CRM114-Status: UNSURE (   5.74  )
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

On Fri, 2026-04-24 at 08:14 -0700, Can Guo wrote:
> Introduce a new generic function ufshcd_query_attr_qword() to handle
> quad-word (64-bit) UFS attribute operations. This consolidates the
> handling of 64-bit attributes which was previously scattered across
> multiple specialized functions.

Looks good, clean refactoring that consolidates 64 bits attribute handling.

Reviewed-by: Bean Huo <beanhuo@micron.com>

