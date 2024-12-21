Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E21E77184
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Dec 2024 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7wU5N3Rc+yxdkSrB3ZsiwvxSqXteUyf9TiI9dS8GWc=; b=0IVf+xIl1Ld7riwn0x7piT84cN
	SQKNmQcoyTaBSDyUapd8mHWrDf95T+J97z4Hy0Eh4tB/3pabIWcoOvUZCyEPyFyF97ZKLHDrDiM/D
	PkBJ96pY93m6ANCXx9J7x8jTtJ8GLna7Dq0knpm+mCRXQdwzdDWP9I7rt0JadbZJ/2t3uxamd/vKy
	22kseRfJlqUXFerpxCYZaFbClfJ8u9yzB5JPcMV+WntMJlPF04hUDGYolws/Ay5Zgy6GTdD5UWo3X
	kb+4fdDNS9n7d9gZ5xvdWH2CreJNeRN3DfisgTusBKNXgELaE5ppXlHyV6OtXnQFlllKwHIu3hUCh
	rR1fpcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOwAP-00000006oue-3Tvo;
	Sat, 21 Dec 2024 09:53:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOwAN-00000006ort-0svv
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Dec 2024 09:53:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso23461845e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 21 Dec 2024 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734774777; x=1735379577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7wU5N3Rc+yxdkSrB3ZsiwvxSqXteUyf9TiI9dS8GWc=;
        b=ALczjC8i76jdDT7NOMVQ5lJdewHK7H8KsLRDC02Dc49T8SLKU5dFrXmwaZ1r0tt725
         h1COt4VePE+STrPo5dHAsrStCVH2GpTMQ5Jfhz7SqMU/mqSulsXCqxmfzU9ZXc7RX5DP
         FptbEy75tT9plSHALNDLEGqQNfOmQaX7oBpSvIZRLdayLDOydHECEfqHIKNATspG+1SZ
         t1moKgX0cibPxU8SYlEawuU2P1M9g/2bpKcQpDn+04qv3YVoVS11LRUTHXo9dyRFJ1Y8
         nXV6onlibtOwjx+PNcybWkDSX0zPBRh3kygXosCdmYW/Qbk0o6+1rCBkvyiwBvMB3tf0
         InNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734774777; x=1735379577;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7wU5N3Rc+yxdkSrB3ZsiwvxSqXteUyf9TiI9dS8GWc=;
        b=CrHB4FO4Wft7cRrmiKn2SrY1LbZCfjcFvVz6fE399XWvXweq02wS0hhqwGce7B+Qsr
         Cjl46CvQNsKKfFb4ppQxx3zeqJ7jRrCy6mPMPoxgghItu92FoNaUwjg+NapYCvVdTAUP
         umozcRqOVQUFj1gpLt3hS+h/wQLneCI56337WS+62t3pnJvI10QkQ6UbxIPGkEggwNhc
         KXohK6uBdfWkvW2iIHNbb++l5fdVZv965iD0ZX+QhaM4W8MCBJb7ukRmvqO4hIWwj3nG
         pFqmaJafsOvYDRnLPpVWHPeaKrROfKWQ2uGjMO2wfeqQbtqw0Ov6XM4iUwG0/3ce7bhs
         mLaA==
X-Forwarded-Encrypted: i=1; AJvYcCWpmcZGU6TdajXRaxa24RrVAHph7/oAwXnoeQpprjUNQzoxAquhRx1u9nJE+UbEBE7vRSTVCsOlOs72KccJcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9mxmFBRpo8wbefIS/HLiR8eH/fGteWPazHuCO5XXQGgzyyId/
	ytXQJKBQ0Tc/DAUVEs62SY/Q10JHP7RJcIo/xVHDpjonUewjo3Ug
X-Gm-Gg: ASbGncuCh/YGeQ/Gj7H6/QeGHRPhhOQBSWY70uPoAFIx9Ux4OePMhn8hNmv22ySVUur
	40CfPioPzrSLHWF/o87MI9StbpRR+k2ewj9abcrNsbSfKLsZNsgn6kttAULqNpeDF29r25uskoa
	gErqzXLFPRTwbAeDKEWOO6RFL4GCy7/0T3WYEjzkQbbh8P6SgCfhzZw6VOJSMyb/We0Qv4f5ZyL
	5wJtFLhyHpVvZeW7UE5YxQPh2sPxcE6DN2IHMtY0rkzpZjUMWSvvQApynT8ndtwHnSGXyaNNlvk
	tmLR19pk+8OdxpUZ4FSxkyDlNbidPt97LfqdnK4=
X-Google-Smtp-Source: AGHT+IHjxLdXW8mbGjkft5APD+lMWkYg/9/MWVjfMYYRs7EuMja17eWwm0wb+Q5Gfbj7nNRta4GP2Q==
X-Received: by 2002:a05:600c:4f89:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-4365fc09731mr81614135e9.16.1734774776704;
        Sat, 21 Dec 2024 01:52:56 -0800 (PST)
Received: from [192.168.10.194] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm70967715e9.38.2024.12.21.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:52:56 -0800 (PST)
Message-ID: <1eeecc68-be5f-46e6-aed6-594c4b32df21@gmail.com>
Date: Sat, 21 Dec 2024 10:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And
 Hibernate
From: Sergio Callegari <sergio.callegari@gmail.com>
To: jglotzer@gmail.com
Cc: Aaron.Hou@mediatek.com, Chris.Lu@mediatek.com, Deren.Wu@mediatek.com,
 Hao.Qin@mediatek.com, Sean.Wang@mediatek.com, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, luiz.dentz@gmail.com,
 marc.payne@mdpsys.co.uk, marcel@holtmann.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, steve.lee@mediatek.com, tiwai@suse.de
References: <20241127231432.8112-1-jglotzer@gmail.com>
 <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Content-Language: en-US, it-IT
In-Reply-To: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_015259_274939_76A5533D 
X-CRM114-Status: GOOD (  12.11  )
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


On 06/12/2024 03:29, John Glotzer wrote:
 > Sergio,
 >
 > My apologies, I neglected to mention that my setup is PCI, and not USB.
 >
Thanks for confirming, good to see that the issue can be reliably 
reproduced with a setup similar to mine!

 >
 > What I am struggling to understand is given how easy this issue is to 
reproduce -  an AMD CPU, Mediatek MT7922 wifi/bluetooth chip,
 > and a 6.11 kernel, you suspend, and then wake up, kernel panics -  I 
would have thought that the interested parties would
 > make this a priority.
 >
I wonder it it might be possible to revert back to the code in kernel 
6.10 (that worked fine), until the current issue can be triaged and fixed.

The other way round, I am getting the impression that other changes are 
getting stacked on top of the faulty ones, further complicating the picture.

As of today, with kernel 6.11.11, the issue has /worsened/ for me. On 
6.11.4 I could hibernate/resume by kfkilling bluetooth only, which was 
not so bad, since I only use bluetooth rarely. With 6.11.11 I need to 
rfkill the wlan too.

Can this be confirmed too?

Sergio


