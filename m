Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D080EC7115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jun 2025 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OKiK32kFE3K17oXdM4Ui5D7ygEP5HcZ5gRlOoGAswjY=; b=pta5RXCv8aR6mIl6hGuX0v7+oC
	buHkjPF+8X6p54xKJjhU9QkqAnvbUQs3voo0PVwAlZG0KRUBi1MQO25CQ9D5xVpaVbxMRFjKK4ldt
	lZL8nLGeEzVS/NKD5ApD9tstyf1xt+2Tedt0AVm7+JrDPwe3QLJFB4A2fQx4KDYOOeHV5O5wnmnKz
	6YWjkrJAKWwOpWeNnk3hQUtVul8lQk+GndD3TWZ5zpgKIImGQTWzbxoHVjOdtnz8x7nP+9zJPiBt8
	Zhx/rfAA6rJdkEst+Wo0zlZZGYxXFEjeA1+aVUrE6uMEEdkfMvlh8PwEW5oFeNrmITmkOCgyyr08M
	MxAQFMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiMz-0000000GXPs-1qQ6;
	Fri, 20 Jun 2025 20:29:53 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiMO-0000000GXLq-3mwR
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Jun 2025 20:29:17 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32b50f357ecso18642551fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Jun 2025 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750451355; x=1751056155; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OKiK32kFE3K17oXdM4Ui5D7ygEP5HcZ5gRlOoGAswjY=;
        b=J/mE7/wT97cAh++VsxutG8CAHNsa+qxhpfpwKi4rpY/QZ9z6HbUN96GKwk0u/Hv/D8
         TpPJvtY4HJUi7ltK369e5zbR9dbwbyPY1mxJtF7826KdDlXBaI7/8WGtqE3g1YB3MSP6
         POMXjKEdqD9pzCVDwNkmy04LDwuiqClcj/dkJsZ9KF30eSYwh5gh8KY7TxBZA2VNvfEL
         uxTaid5j9E6Omry/VZOqKG6wxytW5oW3fusHpXFsU6O8Htb2TrmLRnLZLAD5V+xWEcB3
         i/d8R4yvN2W8/p72D/o0X35tJMf5j3QbNk2LKWEHxL9LozuwTGgtuekZIvaUxHZNhw4f
         bjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750451355; x=1751056155;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKiK32kFE3K17oXdM4Ui5D7ygEP5HcZ5gRlOoGAswjY=;
        b=ah0ePzu8FS1/SrbwK6fT+Z4h6Z4GDTTAaFyH6Q4FY63pZF4o0DsKxR/uSPWlEmgAeu
         CmB95Xp3MltqkllOZTnn7mie7h9oWN/nLNWeJEazuqN+7Uj6pJkklWEhkvLXgoN5zl3Z
         SisybcgO3FKVXTU7iI4a5hKzaWj0/GHjBgqnwNn1b+ewPivA6RjWY2iJPSojzes1ujBK
         kmU7lwFcVgiSMxPxhNdamugpreJb+ga0Qz7/7j0w+0xBVVC/BQ3I3kLvQVXeibPB3Pwc
         pV1Q9i9us71bMrc6xN6TsDX6mw1v+aKeZZPI+iO1aN366H6qhJ6gJ1cyBoUT5AKNXI4X
         rXGw==
X-Gm-Message-State: AOJu0Yzk+nfdpEadpoU+4Zv2OQVqi28I977BCDvl5DkPTOs2/aLXtl5u
	O8Gc/Av80F7dz3WlXavcymIYDy4PT6KcPDwdyP/URJiDMtJXGW3pTr/+/SX4MI/nfsc8Cg7MpQi
	HNaPSTxapcK6XvbbATwOYfr1rCsA6L/smyV1g
X-Gm-Gg: ASbGncuME+9flROWUCTcLpLTHiEq6TD52lslBteLBD8fQMSrZF8PDPizdaF4ToZYxlX
	tJT46eD5LVwt6BnG2QfNBLlRJ1y3/d7C9j8WpiAsRCmioHwKjcvxdapn+K1BVKDRiaWmAuNiaQ3
	GDSXCqApOR2h1h/yMwFMHuQxGD67XhI8NbIOaMZeC3oDvKsmUGMyQ/sQ==
X-Google-Smtp-Source: AGHT+IGJBlmnjNsJ8ZQvJWGUxp8+how5XFS8riQ9QCf/991DI7vScbyRt8fP1opphz/1VA7BiC9D+2E4ubYW/k3nxI4=
X-Received: by 2002:a2e:b5b0:0:b0:32a:ec98:e14d with SMTP id
 38308e7fff4ca-32b991fc08fmr10850851fa.16.1750451354449; Fri, 20 Jun 2025
 13:29:14 -0700 (PDT)
MIME-Version: 1.0
From: Tadas basix <skarpinis@gmail.com>
Date: Fri, 20 Jun 2025 21:29:02 +0100
X-Gm-Features: AX0GCFuyIvBEhfhL_JuPeH76UwlS6SE18THg7gaCE8BMhx0_Rt3BMG-T-azEpYc
Message-ID: <CAJg4s7RHZz+-AUuq4pnhZRL21MDKx5G98kcNX=Sic-RG7LmrGw@mail.gmail.com>
Subject: mt7925
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132916_943579_44D071EF 
X-CRM114-Status: UNSURE (   2.50  )
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

Hello, Bluetooth not working on latest archlinux kernel 6.15: Jun 17
09:27:02 archlinux-pc kernel: usb 3-7: device descriptor read/64,
error -71 Jun 17 09:27:02 archlinux-pc kernel: usb 3-7: device
descriptor read/64, error -71 Jun 17 09:27:03 archlinux-pc kernel: usb
3-7: device descriptor read/64, error -71 Jun 17 09:27:03 archlinux-pc
kernel: usb 3-7: device descriptor read/64, error -71 Jun 17 09:27:04
archlinux-pc kernel: usb 3-7: device not accepting address 9, error
-71 Jun 17 09:27:05 archlinux-pc kernel: usb 3-7: device not accepting
address 10, error -71 please fix.

Jun 17 13:57:40 archlinux-pc kernel: Bluetooth: hci1: HW/SW Version:
0x00000000, Build Time: 20250526153203 Jun 17 13:57:50 archlinux-pc
kernel: Bluetooth: hci1: Execution of wmt command timed out Jun 17
13:57:50 archlinux-pc kernel: Bluetooth: hci1: Failed to send wmt
patch dwnld (-110) Jun 17 13:57:50 archlinux-pc kernel: Bluetooth:
hci1: Failed to set up firmware (-110) Jun 17 13:57:50 archlinux-pc
kernel: Bluetooth: hci1: HCI Enhanced Setup Synchronous Connection
command is advertised, but not supported.

