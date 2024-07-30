Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BB4C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHzsH8GNpcTxt+twbBL0Ewf9B4bq1wHaOSl4nx4RC1s=; b=T81+JEO+TBR6PddPuc1jlYP5+4
	1GcFMFM7bSoILAp2GTADvGHfD1TDsqurG56f48doBziSSqFY/ZogGOzPAE/rpwe8m8yb35iYMYicR
	aPZ5viTBo4q9Sjh5Q1RH/Ift9oPr+vyNS59Q3gzs3UzG6dVvbpDhfzKWHjmIJ8+Vtoc58DyOg1JMG
	VjOgpi7BWeosn4VVEBC8XxATEAyMTa4djFA2xpueMrrjDf2FYP+Jyz257L0OIKqBNHE5yJrKUydDi
	v7EuWHlw94pvFXMgpDTlUOQakPPUzcwGau02jeNTtao97x9/mDkqStB3a9Pc5D/PqA5uzebSOgQ8a
	4/AJ3f1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYovb-0000000FggO-1SJX;
	Tue, 30 Jul 2024 15:38:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYovX-0000000FgfI-2dvO
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jul 2024 15:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722353893;
	bh=xXFjtGCvB3jw9r5d2Ci29zrADIaI+wUIH9WGTHNxLwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdqh2AOE/X6L98VB19J/mS17tNPr+cEov9didJwrYLmS/Y7E3unbnze2RoDtDXREt
	 GsVd+kQuqQDDr2FAigtkXCKtlD4N/LuWYgWnjyZ3Uy3rG66UCCIuo0Sk+ykzMrUNb4
	 mQIMdkRetXXolEEiQMpuJwGk4IxumSxwqyJFtliPF+F+2f9b4eZZd2aoKh/XzEg99l
	 QYTwst8mcKGTmNsjliv8vB3Fk8+isihNxfxRZjrttpnD3MarVzdFdm80QRt88ka+0E
	 NMj3Ia7XabkVWCvIHuYTRa7CQcMXKOQvPi83EFonyMePAXqPCMzccQfGY//919UEOh
	 hLtclEDo0lDnw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E6CBB37809CE;
	Tue, 30 Jul 2024 15:38:09 +0000 (UTC)
Date: Tue, 30 Jul 2024 11:38:07 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chris Lu =?utf-8?B?KOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>
Cc: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
	"marcel@holtmann.org" <marcel@holtmann.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
	Steve Lee =?utf-8?B?KOadjuimluiqoCk=?= <steve.lee@mediatek.com>,
	"kernel@collabora.com" <kernel@collabora.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Aaron Hou =?utf-8?B?KOS+r+S/iuS7sCk=?= <Aaron.Hou@mediatek.com>
Subject: Re: [PATCH v7 8/8] Bluetooth: btusb: mediatek: add ISO data
 transmission functions
Message-ID: <9a1697ef-27d9-452c-89ea-159ec3d028d7@notapiano>
References: <20240704060116.16600-1-chris.lu@mediatek.com>
 <20240704060116.16600-9-chris.lu@mediatek.com>
 <7851401b-e884-4ed4-998d-7651f427ad37@notapiano>
 <6a6dc0b081e8caa99172666c71b0826c1cb17a1c.camel@mediatek.com>
 <e9bdcf44-e20a-4824-a0d4-8c6c52ed1e9b@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9bdcf44-e20a-4824-a0d4-8c6c52ed1e9b@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_083815_824400_27BCA72F 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, Jul 16, 2024 at 08:20:46AM -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Jul 16, 2024 at 07:59:53AM +0000, Chris Lu (陸稚泓) wrote:
> > Hi Nicolas,
> > 
> > Thanks for reporting the crash issue, I've sent another patc to avoid
> > this crash issue happened. kill anchor function wasn't protect well if
> > MediaTek Bluetooth failed to setup. Add a flag check when running into
> > btmtk_usb_suspend function.
> 
> Hi Chris,
> 
> thanks for the quick follow up! I see the patch at
> https://lore.kernel.org/all/20240716074947.23073-1-chris.lu@mediatek.com/

That patch was merged without the Closes tag, so manually closing the
regression:

#regzbot fix: 'Bluetooth: btmtk: Fix kernel crash when entering btmtk_usb_suspend'

Thanks,
Nícolas

