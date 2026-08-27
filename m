Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA66C61DC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0taG7WLLgQYm0IGIOJbRW2QYtWFJg1/n5iUrnFNzoA=; b=1VTe+LZnOouF+PPh49w4jE0CHU
	3+07W+mQV67ol85ziO6Iy7aYtcB1MMXt7uuR9Ngd1x/zfPRb3HHmkiT/crE3/1EVHWQLAxrXPScZ4
	TpDSVArFo9v+nCQImwow3WO6XGjRvvVdd6LY7XzVaEu85LFpYZHuh9IftD7hqMUBUMAKn4WBq763g
	CloIpM03v19tGYM3pvFq0jEPmiGX31JTqLa4zc07xwz+dCx5JMvqB3C9DR8UvdNvTqTM5bT4ypqmO
	I6axYzSmmT3ir7rzjyk42EXEauNxKVBvOBb68acs6uV1zeGL/MwHwo1v6iO9FZi+TpNpHW5IjOtOp
	MOEuXaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaqC-0000000485z-2QtI;
	Thu, 27 Aug 2026 14:12:28 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaqA-0000000484l-1bpj
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 14:12:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787839940; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cI8uaFDYhJ7X4XtH9naXxG1km2puCbAf/2IEefL34T+xv4UjWusZYbD4XsBdvs4oLH
    yvb5Du0WZ6PFoRmt05ELLVPgHmIOShUFyPVtbzwh0UH3IGl5nex8b2+TGVlF+r6w+JX4
    9pIWbZUX95u8QeRI9BfYOry9HgQJF/tj5uXi73/pvV7WsLlYe75hm1YonGmLE9Wezslc
    2ocMPkwXjSsUtrYg5FkbykEjhZ+Y+7OPt5llU0vbFyeLAzT1cShuwaZGgtcgteKzUmYo
    FmW5h1HyxDRjS2EZ6zo52YuXxFylc4XcuzrLIH+lbPLQKvAb09lRN2MS6EgvHv3zJ1IP
    IflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1787839940;
    s=strato-dkim-0002; d=strato.com;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=n0taG7WLLgQYm0IGIOJbRW2QYtWFJg1/n5iUrnFNzoA=;
    b=BkRsjTOQs4kS35ixo1COncPHq/RNRX6REeERYKS67rW0L3rFcZ1pctsQfEJ28cJy/L
    b8oRTvyRwHjuzNcoUF56Qng2SVlwfct2fNQpOSpHDm2I5VmZaSPL2GEtwNOhM8czU9Jh
    s+BM33MeDLP5MLwqBF9ulnf6YNbtyWcs2DaXXYnR/S7wr3H+QZoVY/RM29FsBB7a95is
    dFDX3lq8oPYOsV7BXf40mgKpvt88Afr1bEaSdNPs32HSl3zmxsi/3Ka8qffa4t069aYw
    fBtMPF4hG65vZb1HC6CzeZIIOT5E6F5zvpJ90zOYpAMZsOAd32cIf/AO88LlGEnHftLv
    Om7Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1787839940;
    s=strato-dkim-0002; d=donoper.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=n0taG7WLLgQYm0IGIOJbRW2QYtWFJg1/n5iUrnFNzoA=;
    b=a9tvg8h04t6UDUkczNz+EzNRAZ/791Y9ucwHE9iWFzZ9oAU1U5cmr9bBzEDRfmPe9u
    NcAvCfnsDwGivcySh7VndHHV/xHtl7FnD/KwMAI2l6lsmpdHk0ahl+qfcuql2HRvebg4
    Sg+R0IHabcm6Crwqr1CJ1cuFrw596QvF1Tyal4pylLYoXHL6Eo+9jjSYet6hDPrK98Uv
    q8FTQgVzDrUueKJ4WCgjCnCQr/bBsbt5NHPdNLMO6fjwJFPjqA6Ntdo65M1WWfsGCDld
    jUB7z4Eu6RJqbo6zp3Cq03cs0deWnZqu4/aAd9p+s00ZqGAeytY6oGHwE/IYBEondyoh
    tecw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1787839940;
    s=strato-dkim-0003; d=donoper.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=n0taG7WLLgQYm0IGIOJbRW2QYtWFJg1/n5iUrnFNzoA=;
    b=M3VAA2FxvNkpqn2QF5iO0z1Mosfs4YPuBq7QZqSZgZBJzsFWDM5TyCeaPgkWMMIaxz
    QLrL8iL9eY8q4WyNf/Bw==
X-RZG-AUTH: ":KX4NfmCsdPGj0nr/y4FSFlVknuf9SJ6N4Btb0f+wu0wGVNTO2XPi1QbPo4VL"
Received: from [10.234.49.190]
    by smtp.strato.de (RZmta 55.6.2 AUTH)
    with ESMTPSA id 0ba66927RECKwEs
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <linux-mediatek@lists.infradead.org>;
    Thu, 27 Aug 2026 16:12:20 +0200 (CEST)
Message-ID: <ca2a108e-ab07-4ebc-bb51-9851d173b63f@donoper.de>
Date: Thu, 27 Aug 2026 16:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Erik Steinkamp <erik@donoper.de>
Subject: linux-firmware-mediatek 1:20260810-1 breaks Bluetooth keyboard input
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_071226_681022_EEBA8AA6 
X-CRM114-Status: UNSURE (   3.43  )
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

Dear all,


I've observed something that might be worth for you to know:


Summary:

     Upgrading linux-firmware-mediatek from 1:20260622-1 to 1:20260810-1 
breaks Bluetooth keyboard input (BLE HID-over-GATT) on a MediaTek 
Bluetooth controller. Downgrading back to 20260622-1 fixes it 
immediately, with no other package changes.

Hardware:
     - Bluetooth controller: MediaTek MT7925
     - Peripheral: Keychron K2 HE keyboard, BLE HID-over-GATT (HOGP), 
current QMK firmware
     - Host: CachyOS, kernel linux-cachyos 7.1.8-1 (also reproduced on 
7.2.0-1), bluez 5.87

Symptom:

     the keyboard pairs and bluetoothctl reports Connected: yes, but no 
keystrokes ever register — no input device is created at all (checked 
via evtest/libinput).

bluetoothd logs:

     bluetoothd: src/service.c:service_accept() input-hog profile accept 
failed for <Keyboard-MAC>


A btmon capture shows the actual timing:

     HCI Command: LE Start Encryption ... #64 13.258318
     HCI Event: Command Status (Success) ... #65 13.258704
     bluetoothd: input-hog profile accept failed ... 13.260434
     HCI Event: Encryption Change (Success, AES-CCM) ... #66 13.303230


The HID-over-GATT setup in bluetoothd (a known no-retry race, see 
bluez/bluez#1911) gives up ~43ms before the controller actually reports 
Encryption Change. With linux-firmware-mediatek 20260622-1, the 
controller apparently completes and reports encryption fast enough to 
win this race; with 20260810-1, it consistently doesn't, so every BLE 
HID reconnect fails.

Steps to reproduce:
     1. Pair a BLE HID (HOGP) keyboard/mouse to a MediaTek Bluetooth 
controller running firmware 20260810-1.
     2. Observe it connects but produces no input, with the input-hog 
error above.
     3. Downgrade to linux-firmware-mediatek 20260622-1, rebuild 
initramfs, reboot.
     4. Reconnect the same device — works correctly every time.

Let me know if you need anything else.

Cheers,

Erik


