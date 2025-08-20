Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF784CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=; b=dTcrIPqaZgss+GE0+9a8ToTm6O
	mVC84YJlmpaX93w3GcrpVr/BGMyesWfCC1+fWnS000IQxXvvM5tUxGaNmaB7SS4ykhUJukEJn3HQe
	gT3Ae0Cl4Xqt8Um3z9ywtkgC3Li8dz7q3zK9LPbzlRbfN+6qtDvI1rppe3V9kc4eORShzfblweQ9n
	k4nDTfLhA+V6wMkpOU01taRUvdMRAlYjlpdIZqhbtYBRxJ1J9uNIPTIU2DqayC6itzza7vPdu9HyL
	nKBkCy2hpNgSSLkEEspg0jJRwO/Ft6TFeN97Hk5r3yZeopE1pw+NAjgPmW/dQoWSKryxa5T0WZShy
	l1uh/6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohmI-0000000DXEP-47mn;
	Wed, 20 Aug 2025 12:18:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofxj-0000000D7q8-0ndC
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 10:22:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-244580536efso45169705ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755685354; x=1756290154; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=;
        b=M/Gtq2kTUQoASa9yvUtTGee0z/hSr+MCUTeWXXbkMo0zUdpPHmE1e0xZoPfeENS8Zq
         lSXmdikD3IPUAkbFIRK9GDGhdg4mLIpJLm+IGM4eyn84UNjvSmmcNwec3SzWIaPUdhHW
         VcRV4W54es+fP0+/lHr6Jvir1LETKjMXZCUsORHaZjbz3x4L5TDqySmBco4G/CkbhDiN
         1OsOa7LCVZeMJk4vD2SnKwUyHEZ4jFnL5hcRIfn024x/vWT8GKiT+v6BP49tHUUutHrC
         wqNAXN/kScxgVdL5HEm2Q3KtYiFu3ttya1G3Vzy+BpBDO8zf3DHQ/zk1gyeh2Wk5NwXr
         GnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685354; x=1756290154;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=;
        b=vPa1ktMJEt3/IBuv3FSFzRw0MNnmSKqjQPUwvv3MWb9omGM2y+2rjcFr3DwLLKibcv
         OdLxeZhzY4eDX0vS/LUbe9v0VgFIH1S869IBQ+oD8+h77Hn6+I5hfu5sFjyWVpjGpEp3
         nTP0MAGsjVfR3uBrnh2RLQS9qRZje7A/puMpZFA/VnQ+/+3l1WrEeawHm2h5fYtcBUt4
         G/eNJxS9Fq/2ICJ30wHxbATJXeSsf/vAI4xnuzuo/zagq7qHkk30eOv3FAa1BLX58pIq
         dsbutlDHzX8+F9s29BakGZeRDMtPY3N6NY7FWeFyF4AoGDhaQXjUolH2U0Sxd35B257r
         xN0A==
X-Forwarded-Encrypted: i=1; AJvYcCU9yWRTMNLvvStZrjQGNGE2UMzLp8Au/dcprcQxsLzIp+Tz2oJaP/Dj8+h8FbltjdfjZNKwcl84bKDySPGoDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtYuotfeDHsoQImbfdtfn9MJz6u+yfFqhrzsllKphcEC/AufWS
	gYvcYyOuqS2jtUzj7CDnbYhlfTQeY3OETR2s/JxJFDuPs2aJUAH9EM3f6csuw4/yJGs=
X-Gm-Gg: ASbGncvC1J5yEVHHBKy3IAghfdpwgguS8lxZT8DNryTOXHJiQvLTzleHltZijFHHlLt
	Z71N50dU0Zb4QYKrHLkGSh66l85RNVeGCa78PZ7jZDqxFH9Okjjh0wCGqnpq9rig/w1bY+pxYFk
	Wap/5DHei+CT5/Jfnprhv7MrJ26EvFGaDUo+BhliicsshQd3O73gxF9Cj2vBzQwgtqdU6CioAQu
	160lmON1t2ACgWnyC6XVdZcI0Dy7fAhQvxAZz/ZA72VLm6orWrmMILYVFKBI5Zg1kpRCFFPIe0P
	dliJUJMLJovXt3p52FX0tclmfBGgxyxI7d8d/cgYw6vdvuGGsdzzPJgCj/vNCz2Dt/RJCDT9jOh
	yUDu9Yp8/AYe2EwE38jpD67Yw
X-Google-Smtp-Source: AGHT+IHC1vhZMOE2tywrBCJNFfsWMse4MPwivKurQqxzCX6JevJiyFpMEeYsHEkpnp2GH2btUtaT+A==
X-Received: by 2002:a17:903:287:b0:240:3d9c:6340 with SMTP id d9443c01a7336-245ef11b097mr25715015ad.20.1755685354013;
        Wed, 20 Aug 2025 03:22:34 -0700 (PDT)
Received: from poutine ([2804:1b3:a702:7d26:1577:2536:a82d:763b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e5c1sm22062005ad.161.2025.08.20.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:22:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (boot) sleeping function called from
 invalid context
 at kernel/locking/rw...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-next@vger.kernel.org
Date: Wed, 20 Aug 2025 10:22:31 -0000
Message-ID: <175568535010.3222387.7351336690916179632@poutine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_032235_353856_1F7AAEFA 
X-CRM114-Status: UNSURE (   5.45  )
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
Reply-To: kernelci@lists.linux.dev
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org






Hello,

New boot regression found on next/master:

---
 sleeping function called from invalid context at kernel/locking/rwsem.c:1589 [logspec:generic_linux_boot,linux.kernel.bug]
---

- dashboard: https://d.kernelci.org/i/maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  5303936d609e09665deda94eaedf26a0e5c3a087
- tags: next-20250820


Log excerpt:
=====================================================

=====================================================


# Hardware platforms affected:

## mt8186-corsola-steelix-sku131072
- dashboard: https://d.kernelci.org/test/maestro:68a572e9233e484a3fa2c0db
- compatibles: google,steelix-sku131072 | google,steelix
- 1 fails since 2025-08-20 07:25 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a429e6233e484a3fa0aba6
    - on 2025-08-19 07:38 UTC
    - commit hash:  886e5e7b0432360842303d587bb4a65d10741ae8
    - test id:  maestro:68a429e6233e484a3fa0aba6

## mt8195-cherry-tomato-r2
- dashboard: https://d.kernelci.org/test/maestro:68a572ea233e484a3fa2c0e1
- compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
- 1 fails since 2025-08-20 07:25 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a2ce76233e484a3f9e5dcc
    - on 2025-08-18 06:55 UTC
    - commit hash:  3ac864c2d9bb8608ee236e89bf561811613abfce
    - test id:  maestro:68a2ce76233e484a3f9e5dcc


#kernelci issue maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

