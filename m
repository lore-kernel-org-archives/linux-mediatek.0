Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50850C0218D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBAmHsVRYatgodxfmWfN1c6yV3AJ+2DuOOOfnLu1pdU=; b=tL87R7ox7Wy10x+Vib6oRGgKk0
	wjIOSvvm+veE8JVA0MzjTQc49O8h0yU+FD62j47zC/l9JXmLp0tXGkqPvD7olxtPjjnyQN0J6pVT+
	uxflbUHLt6rsbLuo+doJOWl5fSRQjN55qNbHoXMtS2E8tF9IyFoOWANvMZFk++4UevwFkwLG+jMan
	TNnM8tvhcJ0JL6M+ilfm8eN2BlU+Ivz7E2Rdh4QpJrkxM7ePmmKpeLuHUSfwXxCzHVvzk9n6XkBrO
	GQp2XCsazh7xt0f1qiYyNnkVVLzFbqE1ouEWDgbHAQpTLmmESBffsZ5MZiVBvG44k07HoCjTmLqDP
	lfY+w46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCqT-00000007c0V-0KXo;
	Wed, 29 Jan 2025 18:31:25 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCqM-00000007byi-2p5S
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jan 2025 18:31:23 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2a8690dcb35so2378036fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jan 2025 10:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738175477; x=1738780277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBAmHsVRYatgodxfmWfN1c6yV3AJ+2DuOOOfnLu1pdU=;
        b=aNZ3DAxe6gt32nsGoqC17DfKqsLjBkKRIHuE885H19to2x41gg5hAnCdn60YR6JTHx
         /TLMiGb32owEQORgHrvmtPtZOQW0aW/9hdR6knReItIxI1N8WIYw5t/gGCXOqQJF/mgp
         PfGXZuaBJmss3jVxTEZcHN+1KWkecEAjvDwZwqXgfUWBA0bEg4ILqBIzQMScL/POU6Hs
         hTAupbhLGaj529xk7OG/0tj9ZVnXM6zmCp99rkeysYru15qY4JqgDlZsoveAUp8d6z3Z
         t/5qgiz28Z9IOxz48Nb14BbAYHAOpsm3yn/ebuHr7KvaskGeWlfzRPuoVfLgxMtyVDUJ
         Tx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738175477; x=1738780277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBAmHsVRYatgodxfmWfN1c6yV3AJ+2DuOOOfnLu1pdU=;
        b=WKFGYOZL1ZjqKdayVdCsIWkNxERmCdrMjvc8RIJIbhQPjMwTYPgLOId7s5kMNm4eUF
         rjlTMFDvHjOpI9p8s7x47C4CwVJo6H6rZMbJBpON496cPGTQecuS+FQBujxxRgBUvl/Q
         HqhMRqUHXQjiEPF+WI47XxcQ/3smt2oCLA4/EmRU52J/JUy6xBbM3T7swQfX7+5Cuis5
         dw1RZTKkRK9mEoNFKOLABy3UT00dOU4Vx+AYA7Uqg0u54JzAW2RoaqAO12BzfATiq71Q
         zU46uBYYTJbHMt1Des8/2G02LQwHCXg5GTZZGSpUdxdgUbXKMRoYlXn2OtK6pXz3zT+q
         U4eg==
X-Forwarded-Encrypted: i=1; AJvYcCXJamcqxShVp9zJUR2yFrWI8vB/4YPDnYGpG65ZdRSbyQYRBlvMbf7WIsuDxLHdpu6VJQISX1Z5vdt4VrAq6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCr5DKxhIEjZ5MoCVUGrAOY741zPmbL1TilKhr4R20d4yPLZD
	eh2SW2lobeV/GJTTsxA0Q20gqh+lrd+Vy99gdq6DjMMtgB3TCluR
X-Gm-Gg: ASbGncsNbgYxsXdlSNkwrv5xyt5lmZCUH7tIqsBu6akknOk5e+2lEqiEgWGbgHZK/8D
	RHboJuHHwRlX8B2ZeuTwQ2gT2MBbSaaXe9+W5w9yEjyVvOjPUbv9G9sctxbBx5j4bdveG9M2J8m
	9pDSnWc5B8lnik2Ix79dZX5vD6MCTUauNxktaJk5y1ooNAeXZuj11IsaIJUm9bjiF+H9nD5+tG/
	yOIA9syYS7KYz8xAIA5P701iTZg3GQgEJngWl049c/XoqlkV2YCa/CFjXbg+2mk7ioCSEBD0c5q
	ede4YXnUnTTHCmvSgmpLlhOm1Vf2Rq/3wxOt
X-Google-Smtp-Source: AGHT+IFoQgrhZqWDNWjsi+GsbUHYEMoaVrN1HbdaP4CDNbX4DiAKWLHn2kW1C0kpPifUGxx4C7Cu5g==
X-Received: by 2002:a05:6870:2a44:b0:297:2479:a35b with SMTP id 586e51a60fabf-2b32efdb093mr2435058fac.1.1738175477149;
        Wed, 29 Jan 2025 10:31:17 -0800 (PST)
Received: from localhost.localdomain ([23.151.240.73])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b28f4134e0sm4482433fac.40.2025.01.29.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:31:16 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: rtl8821cerfe2@gmail.com
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	jglotzer@gmail.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@lists.linux.dev,
	sergio.callegari@unibo.it,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
Date: Wed, 29 Jan 2025 12:31:09 -0600
Message-ID: <20250129183109.10770-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <585f1075-a662-489b-bd5c-cf9f24291804@gmail.com>
References: <585f1075-a662-489b-bd5c-cf9f24291804@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_103118_713736_E5444672 
X-CRM114-Status: UNSURE (   8.95  )
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

Good news/TLDR
   Yes, so far I have resumed from sleep 2x without any issues
   with both of my workarounds disabled (kernel command line/systemd rfkill on sleep).

What I don't yet understand
   This commit
   (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/drivers/bluetooth/btusb.c?id=v6.12.8&id2=v6.12.7)
   was a pure USB fix. My mt7922 device (not a USB dongle but built into the motherboard)
   seems to be both a bluetooth device (bound to btusb driver) *and* a Wifi device (bound to mt7921e driver).

   I remain puzzled as to how is it that the issue that is on the USB side was *also* fixed by
   adding mt7921e.disable_aspm=y to the kernel command line (since that would act on the wifi/pci pathway)?

