Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uoS6ULmtpf7fOI04QhSGPabunu/i8vhPpZGU9OyEVM=; b=KoiP1niN9ECQcc
	iLFmjNXuACtsHGdiHOWaHnk8RAC7VrsTkRBbZwjsVYVptdD8sYBw1gzEQRhkFPzkr81H70YEExLOI
	epTfxMXasn3s2axBJ5fT+FKgOitTwRg4cbsywCvgLimmzUim+4b05pbpo/oYSXJLHbqyeeJLqqHVu
	COHJkAvPZUDfQTHnBrdqzwDsXwD5/pqjq1qeEdRjeUO2r+gMbqVceolxLWNfGQDdquxRdG9zgy2Ri
	pd8rdm/AnyxfuzVV1SPRNc1ys8MIQVwgiRwwbiiZlCyj7pWNoYulzH7wZi7UUE1H9cfCdhb7SgY5a
	6Dt33Hm/bgHo5MWrc4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdTo-005TZl-9j; Tue, 08 Mar 2022 17:18:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRdAD-005NAv-Os; Tue, 08 Mar 2022 16:58:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55889B817CC;
 Tue,  8 Mar 2022 16:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EA3C340EB;
 Tue,  8 Mar 2022 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646758699;
 bh=laX4D7M39zT/hwn4Cg/k7KyZJm9tgxYL/w79HzyyZ2E=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDXK9FOaHHHYwRxglufflhRQvfvbWhxX7YbHXlpkxCzSXicoNz7LmmERvXYl0qCRG
 vnPmKG3ZhnyKW2Fr/QcddM+LZQAMWsIc+ERnjPGOComoQJkw3S9JutiR2UPiOjdb66
 tlITU1tBs0Lj8Qqpl5Lzop5hCnHN6SNMS21vbcodxZxqHIFLymzMHtetCmcIKyhafI
 YL/aSQSvrrC1gv7c4v9Folq2dmJL5ew2DZHjBRJO86xb53RUv6b2UUhMVaIHr9xK4h
 9NxNJ9lXz4DWp2jqDQo2yiWpvyUKtjMqA7OmwRVUaiyqwv2a0hRi54DfoTDTlJBgRa
 tdrr45fFQ7zfg==
From: Arnd Bergmann <arnd@kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] defconfig: mediatek updates for v5.18
Date: Tue,  8 Mar 2022 17:58:10 +0100
Message-Id: <164675866030.4165470.17163484953895240088.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9b90b407-025b-ec78-a626-faccdbc7ab39@gmail.com>
References: <9b90b407-025b-ec78-a626-faccdbc7ab39@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_085822_008609_4CC6AD8A 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:54:27 +0100, Matthias Brugger wrote:
> Please have a look on the below defconfig changes for v5.18.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: c687cdc66ffc1452a205d7a36132d620f2fdc677

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
