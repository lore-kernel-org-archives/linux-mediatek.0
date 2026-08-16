Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EE0C5DF70
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Aug 2026 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9HEXESutLpOiaj8UhWCcmiSUavGLm/Yffesz0tGfsc=; b=LQGgDD496W6PxnxfmK5SeylXsf
	SQcYAaM8jyL7SSu3EXBtLUpID9X11IPd/Omq684bTkZOi1yvYyqPMA5Iz2YvHNeHVcTqrqL1NVewB
	JkVNEkhCAhvgdOPDeHNPY4dRd0ealvZBpzXbhsTcWfBaKdgfEYbNm8AKlQLJO7tAobh++Z7733eBZ
	WGwlI+/0FX/ULMZZlGv9usw5j/0YtXzKFieH2nAwjjqHxjcjRupmgk1R/IIKK2a2NaRdRWKeXelvA
	6u1nj4FzRCDpdUu/8E6D/gpAAkqpQF7SWrPgGfuh8uJJ42omhfOlXxDdXSZMY6qokCle850PMG4v1
	BOF1hVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbOS-00000004oAM-0oij;
	Sun, 16 Aug 2026 13:59:20 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbOQ-00000004oA3-2E6U
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Aug 2026 13:59:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso2913849e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Aug 2026 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786888756; x=1787493556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9HEXESutLpOiaj8UhWCcmiSUavGLm/Yffesz0tGfsc=;
        b=QZ8xsWqSXpGDL+ZvrkzLdtclY+vWsVk0hON3A1nBKljI/nDhIsoOF5bV7h1JSBrlde
         F8MvTTzQofUH5MvIkG2/Y2jSHKaplo5YaoKXNteGhRM5iSMZZ6FAoFBCm1i9knN9k/+9
         NyhFRtYpIuRaNG5o0q/InhpG4Flal8WZa6D0QDvPVflbSwfys97qC5cTA2/oNlIbtMXb
         DVtsbzlkVrQ8ImeS9QbfMmszyIRaJNYFVH8sw5JLNGNMzg0dnypj0ISvqAKQuEINoyyN
         jXAvsPSgKYX6bp9XCRWZzieUR7wa/4QPzOWC+EbyQe/OKpR0ECpBoyuFS4+Ylg+9bwvj
         +/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786888756; x=1787493556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9HEXESutLpOiaj8UhWCcmiSUavGLm/Yffesz0tGfsc=;
        b=p3vTX9f/96WyaxeOZeYhjsO9oN76NcdUmWcCgiVG1OedG9h+hwRy8NIig806wMk62z
         oSPfR8tLqTfx785CWT7vnxm3cxBtcoZG/qU4/fa43HGtkDRl8AdjUH5IMkfZ5tCArSSf
         r/TRTIGYK/zYTqxJ3ThhLCIef47/rPOh2mkuX57UMuHpT0dzMtaUlqq5tCJmDN2UtbDB
         Jo1V4qyiUrs8OYyTSJtxrrsnEk+2ufi2b2VNfhwzM6CMoYK2AJH9RU1s58tjRcstUFbb
         1PwvqOuzaj+jsDQT0D2Xv2COcMEaCymutf8tiq0o/LTbnjsNYzODyElWaJ+Reu5dcUeb
         ujqg==
X-Forwarded-Encrypted: i=1; AHgh+RqhlAoDzsRaMRn6viHjTAfN3khX9D8KY5cFvw/2tQH1cUn1ZLpeyoEiEyZ6z3jybyHdYr/rLB1jL9pFvSLWQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzInhn4VE8zc4lExE6Jw7vY5/gl827FnJ3HeCZTnDFfDavTqNsk
	ZBDxm6bxR9A5dSjar9yI51XOPC3VkF5z7TLdZ9Xl8Q11UhVH+HJJcule
X-Gm-Gg: AR+sD12cRGp9np/btexmaJqLtpVSzJ28x9EosCZxoQAeFkl+lXJJTeQuIsdztZAUfZG
	JRXfCZxEXkbxC/DPIZVOE20dWP5+srwIza9mUNA0+BlkhblYAHvvvxoTDnDi5xZs8mtE4yof4vx
	BWPmQXYBc86pvfE4Glm2YJEm/Gxea74zVy37EQI8f7DO8LGpgaWeXkhMymr2uXmg86huTx/N+XH
	NNwShBvfYA5Dgd92iMqBIi0RD2tCwYqTRjFRt/7EoqxdiWHAqwYFnfc7Wvp0sMGv4Y+05fsWLkD
	gukX6mK4mzq1GK0f/UIK8ypt+OWmZCeRI3DCM9TYUvMadllBmavwy0FJ4sHKM/8Y+EAYLUjtG0e
	vB2b5Q6KHlDU/6NVePCPS5utJT+XMH9g2or0MRkVRO1IEHd255yqS9HAJamnoh+iwzUuDxg2oLs
	n6Go8fWu0lHprQMGdeKKckE6HVx2ung611HaUCZwbhHzDxQ2SVEexw1WLdmSNcsq7xt7FHLWXgj
	F7phrvDbnD2AqXUQ0KITHkkbyGSW6xdbKZY0w0TmdMgPHb+ksfva3kz0wJgNGLt0HxEhXQa
X-Received: by 2002:a05:6512:32c5:b0:5b3:cd0:6be6 with SMTP id 2adb3069b0e04-5b45914b25cmr3159910e87.54.1786888755964;
        Sun, 16 Aug 2026 06:59:15 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bac120sm1796996e87.35.2026.08.16.06.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:59:14 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: JB Tsai <jb.tsai@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Charlie-cy Wu <charlie-cy.wu@mediatek.corp-partner.google.com>,
	Charlie-cy.Wu@mediatek.com,
	Deren.Wu@mediatek.com,
	Sean.Wang@mediatek.com,
	Quan.Zhou@mediatek.com,
	Ryder.Lee@mediatek.com,
	Leon.Yen@mediatek.com,
	litien.chang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: refactor regd update to fix recursive mutex deadlock
Date: Sun, 16 Aug 2026 18:59:09 +0500
Message-ID: <20260816135909.52136-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629083543.153564-1-jb.tsai@mediatek.com>
References: <20260629083543.153564-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_065918_599515_32A7CAA6 
X-CRM114-Status: UNSURE (   9.26  )
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

I hit this deadlock on an MT7922 (mt7921e) and arrived at the same split
independently before finding this commit in linux-next.

Without it, associating with a 6 GHz AP self-deadlocks: mt76_sta_state()
holds &dev->mt76.mutex and mt7921_regd_set_6ghz_power_type() takes it
again via mt7921_mcu_regd_update(), on both the sta_add and the
sta_remove path. wpa_supplicant then blocks while holding wiphy.mtx,
NetworkManager blocks on wiphy.mtx while holding rtnl, and the machine
is left with no working network stack and needs sysrq to reboot. Because
NetworkManager retries the saved profile on every boot, an affected
kernel stops reaching a usable state at all once a 6 GHz profile exists.

With this commit applied to mainline at 3eb40771c00a (post-v7.2-rc7), on
a lockdep and UBSAN build: association with a 6 GHz AP completes
(channel 37, 6135 MHz, 160 MHz), switching back and forth between a
5 GHz and a 6 GHz BSS exercises both call sites, "iw reg set NL" reaches
the regulatory notifier and visibly takes effect - the link moves off
6 GHz - and "iw reg set RU" restores it, and an 88 s deep suspend/resume
cycle reconnects to the 6 GHz BSS. dmesg is clean throughout.

One request while this is fresh: the regression this fixes was
introduced in v7.2-rc1 by e88098133ed4, so it ought to be fixed within
7.2 rather than carried into 7.3. This commit is only in wireless-next
and has no Cc: stable. Could it go in through the fixes tree before the
7.2 release, or failing that into 7.2.y as soon as it opens?

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

