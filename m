Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEA4CE7CE6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT0gi0boMpvyNasnpRaNdwDsAswvRkFqhrEu9iVOJe8=; b=lYmzHgRc6QEquRfwNG8CHjchHM
	1/YJj505YLSXXJFrdU9Cqahe+jW3s9iyq9QxbEDNUW6ZB5wkS3s7RkavpvVjlI9XdtGrEJl/UHo2F
	++cTbaXmQPXNm9AFydtvoGQ/mQ/KScOUWbdrMUKBRCGHkD+flwB9qKL7nKdALeaaiunYL8Q9V3yR4
	vuYaBoeEnc4wW3K8J9n9QU3N0jHW3E6HOiEYqay4M7tlLTpRTjXkFnoiv+1n+69pwzpCoK8/MzL8Q
	hvY45DpvRn9x3Vo4SfJ/6b50+8t2+xyFGdBiYknRwdJsotJBvqKlIb24dvppSF2kxdp2PA/oecduq
	vCYDD5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXi1-00000001xBh-2uHS;
	Tue, 01 Oct 2024 07:54:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXeb-00000001wbs-1qxe;
	Tue, 01 Oct 2024 07:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727769039;
	bh=Fdshc4z5HS4VUTO1VEv8lv8up1mqx8R8zuvM4emz0wk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DMrGIaBwX0bNIQJNWI/E/smC1zVoO37IDpgeplPP1GBaweWDz0o1c59n3yMFPJr2h
	 vT8u35o354IqBNXfcxbeHjYafmfJfEbT7i3rYV1MpIXzu/iPIHsqa/d5BUIDXk2JS9
	 yfXP1DphGCdDMhYxWGFxQRLn3DbqZuTkcl5UNE8aBK+0MPp1LsNYi6x6mPN++yYChc
	 np6449tGffzRSEVPxEJY0jPNGDvSRisrUVjC1ZP913s3bHEkxWN8rL9EtjQ4Lp5OgK
	 q2TQ7CPkq2/hZRdF0IbgUydzx+NI7Q2dO1iJRsGhgFnVWRMgTddLFQDgijcsXK50sQ
	 TehJHJhQRySjQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F081317E0E39;
	Tue,  1 Oct 2024 09:50:38 +0200 (CEST)
Message-ID: <23bcf642-ad0f-4fef-aec6-af710ff13fea@collabora.com>
Date: Tue, 1 Oct 2024 09:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: 8250: Fix typos in comments across various
 files
To: Yu Jiaoliang <yujiaoliang@vivo.com>, alcooperx@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com
References: <20240929100931.530620-1-yujiaoliang@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240929100931.530620-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_005041_672733_00995E70 
X-CRM114-Status: UNSURE (   5.97  )
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

Il 29/09/24 12:09, Yu Jiaoliang ha scritto:
> This patch fixes several typos in the comments within the tty/8250
> directory to improve readability and code documentation.
> 
> Detected using codespell.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



