Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A13C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLsk7UNbl2mGLlf8AChN6UTKTKuAoEYD5hs7O3ETLuk=; b=aSEleElrqS053P
	jQZ9jd/0PLuk9eMmNOOkbausRYceabNLr77tO5ISv0TqqV0zCkvuw3/OzTiVjIL5EK2Ltrgp9cSjH
	Nsv83MZxMV0gfp2lHVB0IwVLrZdej2cM9s3JsdOXl4F8VW438yDv+O+bCUAsunAYJWFCYANqOCqOK
	9BGPjd5P72WFe6ijQQz5Nl0PkiYYWdJEMB11kpt4EPk8QEcAiecGrWGuItSPGEXOkVsSdDQrEykJX
	WXoYg9GZfp+NOCQrfsQnMvX1LG5p9RQoPY0ARW2KE0VOam895m2ciUViFDotH7EHfxD0smAWZITz0
	al6aBHUD74cW9GAOaTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsf29-00000005xER-0KcV;
	Fri, 05 Apr 2024 08:34:49 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsf22-00000005x8G-2B6d
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Apr 2024 08:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=DLsk7UNbl2mGLlf8AChN6UTKTKuAoEYD5hs7O3ETLuk=;
	t=1712306082; x=1712738082; b=YKN0KdTcRn70PoHAMnRXmXZUDIqjJCy0GB1inue950ubW4G
	aTn5F+nhaYlNcL5scKPMXSavCfPoVVQAXu83IVWTZouvvtvXLN6Gsef1XNOmxyx2naqOen3mXFeus
	V5NZpAb6PcsH95OIDEPPmBcwaZEKuD68vrCuUGk4ekgiKPIbkST1V+qeQqP80qGucurnEFPLbf/Ms
	I3QdTrwA0sdvOm1tXBojfhGwFfnMzWKJ4Wt691v0qifKYcr/3kcu2/W0VzQUo2CDztgVIjZq/XK2I
	vzuVumBpSbtyQHMnwVLr/2O+CAQaGmtUuzSWcGa7N8pp0ywcKamWGqABc1kZUCrQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rsf1n-0000E9-IL; Fri, 05 Apr 2024 10:34:27 +0200
Message-ID: <2d822b6c-8b55-443d-ad9e-03e97ce7b99b@leemhuis.info>
Date: Fri, 5 Apr 2024 10:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920
To: Mike Lothian <mike@fireburn.co.uk>, peter.tsao@mediatek.com
Cc: aaron.hou@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com,
 johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 luiz.dentz@gmail.com, marcel@holtmann.org, sean.wang@mediatek.com,
 steve.lee@mediatek.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240304144844.2042-1-peter.tsao@mediatek.com>
 <20240401144424.1714-1-mike@fireburn.co.uk>
 <CAHbf0-FqUqoDty81OH9_Et7MTWFikYYhEvP7SBVGyeXO-R94_A@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CAHbf0-FqUqoDty81OH9_Et7MTWFikYYhEvP7SBVGyeXO-R94_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1712306082;cd7ddfd6;
X-HE-SMSGID: 1rsf1n-0000E9-IL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_013442_760047_B9B6646A 
X-CRM114-Status: GOOD (  11.26  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 01.04.24 17:20, Mike Lothian wrote:
> On Mon, 1 Apr 2024 at 15:44, Mike Lothian <mike@fireburn.co.uk> wrote:
>>
>> I think this patch is causing issues with older firmware
>>
>> Bus 003 Device 002: ID 13d3:3563 IMC Networks Wireless_Device
>>
>> [    0.315064] Bluetooth: Core ver 2.22
>> [    0.315064] NET: Registered PF_BLUETOOTH protocol family
>> [    0.315064] Bluetooth: HCI device and connection manager initialized
>> [    0.315064] Bluetooth: HCI socket layer initialized
>> [    0.315064] Bluetooth: L2CAP socket layer initialized
>> [    0.315064] Bluetooth: SCO socket layer initialized
>> [    4.670811] Bluetooth: RFCOMM TTY layer initialized
>> [    4.671029] Bluetooth: RFCOMM socket layer initialized
>> [    4.671790] Bluetooth: RFCOMM ver 1.11
>> [    4.673416] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>> [    4.673659] Bluetooth: BNEP filters: protocol multicast
>> [    4.673895] Bluetooth: BNEP socket layer initialized
>> [    4.674125] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
>> [    4.674360] Bluetooth: HIDP socket layer initialized
>> [    5.016365] bluetooth hci0: Direct firmware load for mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin failed with error -2
>> [    5.017163] Bluetooth: hci0: Failed to load firmware file (-2)
>> [    5.017557] Bluetooth: hci0: Failed to set up firmware (-2)
>> [    5.018129] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
>>
>> The correct name should be mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
>>
>> Reverting this patch fixes things
> 
> If it helps, the device ID is 0x7961 and the fw_flavour is 24 or 0x18 in hex

Thanks for the report!

Peter, did you look into this?

Anyway: To be sure the issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot report:
https://lore.kernel.org/all/20240401144424.1714-1-mike@fireburn.co.uk/
#regzbot introduced: 1cb63d80fff6c4
#regzbot title: net: Bluetooth: firmware loading problems with older
firmware
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

