Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA48CD5BAC
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulSpyMaOuPtUjE/kaMsyodJ8z51dXOLCMvbX66Q6rnE=; b=QyGvx0ucSp2C2TQGRGrXk2NaOC
	Iim4ajGPZSVO1RlAbq7r840dq/7VYqgrS9HNukYMt/CYyYBarNeKaIlzmLINcKqs6PiSD5eHxqihH
	Q/VDExCeFWaNtZ6txQYRxkCb6wzP0zVmN7KgcY3iGVKXQVGWxAYrufI6kgVACAeWNOTNmy0dag8QT
	6p+HPlwxZSS5OiStMl28qe7V9QXObtsnyuykIyoqvnX3ORh3buU4b4BlIBqUNkIOppRD5aOiaIhyw
	GrO2xD3EWPPaphm71zdljmRiYJtwQHWHZYocJlflGdEuBBZet4q1tvH6uMKqFX/nICRi9IxEPIQpo
	TbJ16gMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQm72-0000000DHfG-0aW1;
	Sat, 23 May 2026 13:09:56 +0000
Received: from forward501b.mail.yandex.net ([178.154.239.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQm6y-0000000DHeP-0ncK
	for linux-mediatek@lists.infradead.org;
	Sat, 23 May 2026 13:09:54 +0000
Received: from mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:25b4:0:640:a124:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 12A2081181;
	Sat, 23 May 2026 16:09:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (smtp) with ESMTPSA id c9Vn5vMfiSw0-QryM3SAI;
	Sat, 23 May 2026 16:09:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1779541781; bh=ulSpyMaOuPtUjE/kaMsyodJ8z51dXOLCMvbX66Q6rnE=;
	h=From:Subject:In-Reply-To:Cc:Date:References:To:Message-ID;
	b=N44wmmFdnqkjkKXZAqBOogamNYjJ2FWlu12hCeniPiEE3AssJyddJla+YF1s/OiQ2
	 eVwWrbFoQbjJ7bBJV41fKqZJjYlU+7R2ZeCYB2q1aBKI6gan4m4igJ2aKmL2vTjwiD
	 mGk7wXWqgVY78znzxL+tIFHHw/a1clsrBJXl5Z88=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <17ef89cc-32b6-43f4-831a-ab756c6b5e3a@0upti.me>
Date: Sat, 23 May 2026 16:09:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: shayne.chen@mediatek.com
Cc: evelyn.tsai@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name,
 ryder.lee@mediatek.com
References: <20251215063728.3013365-7-shayne.chen@mediatek.com>
Subject: Re: [PATCH mt76 v2 7/7] wifi: mt76: mt7996: fix iface combination for
 different chipsets
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <20251215063728.3013365-7-shayne.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_060952_418687_7C514023 
X-CRM114-Status: UNSURE (   3.93  )
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

Hey folks, this looks like it broke mt7996 init entirely with stable kernel 7.0.10.

Specifically it trips this check in net/wireless/core.c:681:

	if (WARN_ON(types & BIT(NL80211_IFTYPE_ADHOC) &&
		    c->beacon_int_min_gcd)) {
		return -EINVAL;
	}

I'm not sure what the correct fix here is, but unsetting beacon_int_min_gcd at least makes AP mode work again...

