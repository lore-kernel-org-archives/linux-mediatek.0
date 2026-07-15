Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62542C44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 00:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7m/GGbqac2Mb0792REfaI6YRuOV/e795EdrpgrNV6c=; b=uGTdZnANNsr2AYiDqHZebISQcm
	X1UHk5EkqLcfOJvMLetNuEy4Q91Kz0U91Sa4O8kAue/KMqsBoFkPqcI9wJPPhgojrXkH8xHceVh1f
	qpA+rZ0qqVs2+58tRCgNZwZEKsaXnUnrUIqaJwFiKMvF0LmU2qZVwqMFHvztku3hITn5lM8ueVSWS
	2TSHBs22aNeHGLM6hPW6HOj6tHJ5UoXvdCeG3hi016L978pXUjlWsdRfPaaoDxY4Sss2WLunczdRG
	LA3h+jH4dXxNuxauoktDNEt5nFzZIF8RFTHx4GVmJbBCLh3vsBC17EqDfzCBr+7wNAhEvQsV+0Zis
	TFqfuOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnF4-0000000DTuE-33iq;
	Wed, 15 Jul 2026 00:12:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnF2-0000000DTu1-3SUp
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 00:12:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE75C600FF;
	Wed, 15 Jul 2026 00:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43501F00A3A;
	Wed, 15 Jul 2026 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784074367;
	bh=n7m/GGbqac2Mb0792REfaI6YRuOV/e795EdrpgrNV6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aU3asLrJgyQAlwAnJv4HHEqGY8JOFwYW2Ui5dD2aWaMuAFI4zmBaSCjTl4B0Hiafp
	 l+jqIZ98AThbMijEsycmIx8CDR4Y8tInluRXmofoLq8pNXBItUfN6OH0aMREOzCMMP
	 COhQwwC9VX8qpDn8VvKQE2EEqbTW8e3mqmjVFeQIX3RSGgDetssWVx4jsI60bagguu
	 ulCCrDRc7P5cUu1wiZ610skD4IICtJF7LMxdbTwvCLn8QTYD47EKmusS5CfvSBS3vy
	 mZrWaIc6MT64Ts6jStP3W8wI5ZXPTQEMrZgGlkUMzuQkCUYj1Vc0rb2ljtG0Mr2gT6
	 /7sEDuc1F6BRA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ismail Tarim <ismailtarim7@gmail.com>
Subject: Re: [stable backport request] wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon
Date: Tue, 14 Jul 2026 20:12:31 -0400
Message-ID: <20260714200600.stable0002@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713180433.52394-1-ismailtarim7@gmail.com>
References: <20260713180433.52394-1-ismailtarim7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Please consider backporting the following mainline commit to the stable
> trees:
>
>   commit 351dd7d2c80d ("wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon")

Queued for 7.1, thanks.

-- 
Thanks,
Sasha

