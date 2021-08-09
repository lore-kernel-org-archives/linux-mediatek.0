Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D811C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D593660F35
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D593660F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=goDCy+deKGSODEe6dv9gdSIdRpOKMDusg/3h4+ufWvE=; b=AhIMawXMoLcrb1
	w/d192wT7+wh0E5YA8h6p3PPZsjcGDfOijp/yUtTI5UOppqLnh3RuZ9iFfCLeLYttdt4Bjd+sGIjk
	578eyIXN6+Vd6Y0LwWu4IJb6Z7ZmY5hzdOp1SRXo+m3VnSFSs1ywS7ivRb/Vmtk/RvKz7HD/kUBbk
	TcmEoPvUo3AB/+OIu3biRDtRS1NeNUSyC7o7viKFwEsL2gegU4QuEa8gzDICqp4IsKbG07U2KRvl0
	hGciXZVEjW8EddTYWHy8EuagKIzTOwwpZXUCX0dEzayGh1K7inAJ/RH7IiinN/L6G/UDA7wUfxl7h
	rbVHHZJ8P6AOTqtz4npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD4GZ-000WP4-90; Mon, 09 Aug 2021 12:20:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD4GE-000WLW-E5; Mon, 09 Aug 2021 12:20:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l18so21177753wrv.5;
 Mon, 09 Aug 2021 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=3rCwHQK8SMgm1OR5rvr9CshXBJqUQwBfTUHKUWVeIxY=;
 b=qhe1YYIXtUvcb+6U7NQRrVFv9ofeYaGSOX5GQsi/y3oJHHC7bnUSdlUSdqf8vfP5dW
 T/GQP297a8vVMhgQyBaPTlrcG+2cqF1ljtfibq8b4mAhWP/b9+oepdQqu57t8UQcWruj
 C/aBMGf3SYWiO0WZ1tCPBjPLZTXqkV917REwCS+daYpm4hed7GVJfPs0z/HAlj2nqW8t
 KRH8Y/7tAvFz5cRa8oy3bc4GS6XPoSr08Po/DpRcq658zHPv0sBCEIFYRZ9BWJ0iWFM6
 HOgokeGs8OUeCvKQTgtqTqLxFHdluE5YfOzpMirAOZeeGeFYic3vPpuf+LdNbGaTUH05
 0SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=3rCwHQK8SMgm1OR5rvr9CshXBJqUQwBfTUHKUWVeIxY=;
 b=QxcwCQRMdXnKsKPz4iceyHsFU070vNXVKven5zy0DAusE4DoBJWdwo0ipGZdgyUTZw
 6iCHpCWaXyW0/jfqXFGzR1bM6i6swDGKNpRsYEBMbrQg/ah0luyM8zCTjh4kSjZz6u0Y
 gAM/ypS8ZNoMCxnqhFTjQ4E1KVMS+XMpEoEwybMI2RtdxP9iIs3G+/o8d13xo/mq2XhG
 GmHXts9afRAg8kFS5r9GAHUUU+7pQyeALepU+3FqoFlV7hV9gFoYLZ/RcrJ6R8NZJo54
 2leF8AiaF0d+9Jsxz7nDYiGdbYq5Dxsy4HdFB2B/l2J4aD1piBJFpf7jjUGwjPvp1LLw
 p/uA==
X-Gm-Message-State: AOAM530YoZ/2suTSheyDEilB9q2HHSZ+tObk9t7J3Z+IK1qduQZyDT5W
 REu3tiMJ81hf5t86zEWv59uG92srbZk53w==
X-Google-Smtp-Source: ABdhPJy2R57UaMq6vJfQmeZYQpsWGUQaKaY/Ej8RoEDdffdUzDnY1DVimp+bOsclBVLvu9nQbwVMqA==
X-Received: by 2002:a5d:688e:: with SMTP id h14mr24552655wru.117.1628511605028; 
 Mon, 09 Aug 2021 05:20:05 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id l9sm5122871wrt.95.2021.08.09.05.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 05:20:04 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Frank Wunderlich <frank-w@public-files.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts32 updates for v5.15
Message-ID: <289ded1c-dae7-54ef-6b56-9433bfcaf9de@gmail.com>
Date: Mon, 9 Aug 2021 14:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_052006_523440_65D72BEF 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Olof and Arnd,

Please have a look on the single patch in this pull request for arm32 MediaTek.

Thanks,
Matthias

---
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.14-next-dts32

for you to fetch changes up to 293cb6b0ea19e628388959da4baa9558e891afc0:

  arm: dts: mt7623: increase passive cooling trip (2021-08-04 19:14:26 +0200)

----------------------------------------------------------------
Increase trip point on MT7623

----------------------------------------------------------------
Frank Wunderlich (1):
      arm: dts: mt7623: increase passive cooling trip

 arch/arm/boot/dts/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
