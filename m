Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402DFC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 18:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087B060E92
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 18:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 087B060E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CU0UL30lRO6k9L4zqLAVBqoz06ir6OUBcbuR1zSKtV4=; b=s5qbhol2YSAVok
	lIOwcg5pol872z4tg1dYdhhFUijOmezXJa5qEAxw2KjxwwYkT9Vcfm3gsyI7oUy+RnnJj+DZzQFRP
	gqB/28OASW2Dv3EeHB0QiA5FC4qDeX7nRMVkunOyl00fel63XagQjG11KwIF7iNRo8yb9DsmfaUR2
	ZR+iGlGADxdWZPPDBvseR5oddkmVLOD4y0vpafG5WcOcoHsPXaBuyn3kfX33pTjyW3Cxa5FLMr+LI
	0BShka5zan/skgCLISbtCz6tVFY/KAnVeqzNb4SSLJZOHopL6VFtfBqDm1FiMi7+o29wzQaaM7IDj
	lMsDrPevDWTJ9vU3wzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7MGi-007dOB-PI; Sat, 24 Jul 2021 18:21:00 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7MGf-007dNA-FH; Sat, 24 Jul 2021 18:20:58 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id w6so3034176qvh.3;
 Sat, 24 Jul 2021 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KeMJR/oOT6vnUfEf1QGuRaqBtn1buVaEAa8SwfA3FM8=;
 b=ZgQiFzz0yfKej069imP4GcuB6HeHasV7gVLeT/CfcWN/DTJJg/Spjk6rqSuFDFhlT1
 oVmOW7zBobMisHPGm2lJ6U2deTrWP2dVpcAnkBwrEckp1xEgEVLqrGzio/uH9L0FtJ5x
 YwuITmQmANyJv6cVc1xXEw2bnfEQi9ni8vCVJEQierUO67Va65eBkypz5yIlWnx/sRnj
 Rn1vhvhajRBLIKYV1ZblyUfw7X488U151n4vUehE3r4BY6PlShmmVWoqx8oKVthyfLw6
 T5LvrGgwzMWi8l148NpGRoEnKkQskY2AUFedNhoTmCnP1WvfH1mAVmzhtgS6HRfQ60yb
 t50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeMJR/oOT6vnUfEf1QGuRaqBtn1buVaEAa8SwfA3FM8=;
 b=bZyLFUPQx6P1MDvlGLRqcPbURObBApHR/LMBor75oxhjaZCiwKa0iGlGmXfRWwvt/h
 FGF24hsBrSfNhvbicLkd1IiZf+l3Y0pXoe2eEE9ny2wHLwnWQ2rE21xunmg+Xt2ygrpR
 v8qdaAApuYJcUHTAoRbBWNUTgSAjECqExOiXHesIcfYwG9b9XNxhl7XEkOhiJf5kCHOQ
 A7352KMUlJoAAAx2a6Z6kGmA6SLnoXo+GHJgKYz9IEyCfBNyDY44v+j0CJiey1h2qiVh
 CIULF9l9mvwt9QSGTmbagtSQLFFZq+TawoRF4wK7USS/O1hmkyPNk+/wojpI+FmkSNAe
 gzDw==
X-Gm-Message-State: AOAM533RSi2RKMqMJDM6vWet9HJweRVWsUKmPtA1Iq133ND7SqcAF34/
 Igh9T3HNBne9tVPow8TUsczkltT85sKQWP/YhDw=
X-Google-Smtp-Source: ABdhPJwue+Tzkl6UbAMvQoa11TWdFyaB3DBO04u2KVlOxPM50w9P2ankRPrOl20M6vwOqwo8EisbJUGjr8bJVz62/Qo=
X-Received: by 2002:a0c:d68f:: with SMTP id k15mr10642939qvi.14.1627150855374; 
 Sat, 24 Jul 2021 11:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
In-Reply-To: <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 15:20:47 +0000
Message-ID: <CAEsQvcu3jXa4fXJAu7nvT+G+-S2bZ1BPkcuwnT4VjbrnW1Pkog@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Cc: chihhao.chen@mediatek.com, alsa-devel@alsa-project.org, 
 wsd_upstream@mediatek.com, damien@zamaudio.com, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_112057_572658_A9A68918 
X-CRM114-Status: UNSURE (   8.88  )
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

> Dr. Iwai, perhaps we could restrict the generalized fix for the
> Behringer UFX1604 / UFX1204 with some simple logic to devices that
> only have *one* clock source.

Okay, rereading the original commit log from Cihhao Chen I gather
Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051) actually has
two clock selectors and only one clock source.

Correct me if I'm wrong.

This is complicated by the fact I haven't been able to find a lsusb -v
of Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051)

Even so, my proposition still stands: devices with only one clock
source and only one clock selector should be able to handle us
selecting the clock selector to the only clock source.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
