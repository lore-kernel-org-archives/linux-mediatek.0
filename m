Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D5606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fBQtwEJw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNGLONsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zEHPYjirAKrG9qAnDREkrHonagYc18CPGjUC7fikb5M=; b=fBQtwEJwLwSbYEph1DNFvET/tw
	z1iNdTIhQ8jbTM9RK5HWEiP/cxU3CXJ8jMkCgXyRhLijqsZ9SixBAAiQZPUmLOgg2qCnoqJfzZmI4
	fwiVG8I50xkOkCh6UTTxI8xPHteRPBjfJ7SThjKOQyqo8JvFhWYQ6JeUKf+o8aWb7EtezAzus/eHe
	pyAj8MycGFxjwiK4KhEmdCTonZ1Jk0t2Ua0qfRuhoLvDV6aPj53A3FMhw7qIlx4hzrlmD+5YYyNYQ
	l9yCZveINNCorhAzJI2sCh4ia3BTjpF6GcV775YFJ8aDdD6XtBFVNywLoSWHXCeKUcuFJGFu9WFCt
	svt7YuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyCb-00000005TC0-3rOC;
	Wed, 11 Nov 2026 02:36:45 +0000
Received: from mail-oa2-x08.google.com ([2607:f8b0:4864:30::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyCZ-00000005TBC-1E7h
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:36:44 +0000
Received: by mail-oa2-x08.google.com with SMTP id 586e51a60fabf-4ad827109b4so530711fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364602; x=1794969402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEHPYjirAKrG9qAnDREkrHonagYc18CPGjUC7fikb5M=;
        b=PNGLONsy0F8MGHXGhVTG5e3e1HBSHnTET5d7kom6PaSOfp0lyCV+0s3qsvjgHMArmp
         +NXTjLtVZbWeVkeaSLlKxsJa0cM/v1fi72myoUZj/uRTd1Si+kIclmEL/nQgFwJTqkOJ
         yvlwk5qGkYI4JTwYX7bAQIuX6cNZer6mKFfqa7UyUgFuJlc+M433ZrMVIxfWhaMAbDiM
         KAcVs0kZdrzl5P47HFrIgfH4e8y5HTg0UlxD1URSswfwSB5yY6qiH58xYtWPX6JpJQDg
         vLQYFGuytAkFFjoDDVcF3XakYwUfilSqQbO5cuxSD2ZDa61zjKDCUNBYfsZU59+cEZi/
         A5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364602; x=1794969402;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEHPYjirAKrG9qAnDREkrHonagYc18CPGjUC7fikb5M=;
        b=c0VgUFnAu2c+FCMqNpPlGyHOFTDVW7y06HBsr9yk8xJP+9WTRbMI7zgW+xgI0Ludz7
         ohA4ntuchixIRjm5gY13Xoqr2THWp4sBemeiNJp69cm3b/u/aRRlVv8y96hTDFEfIgIz
         h1hqHFyoHGGFAjFTooXRVcWgWGCS1/iUInScVkJL5u36Wq8GDQCcb4dol6Z0czAty2xi
         m3VU+Gud+6av8pk2TCVfuNL14S3Fv7rKfLLx4fOZWx9fcOsY5v4eacZbXwNKn0utEYIp
         dUTz21z3GPVoiBiEvd7nrxNU6BR26Xn8mU99ymc13xUDVVWC+XwbxuSQjR8OfahZxx3Q
         0gPg==
X-Forwarded-Encrypted: i=1; AL+hErGU8DOO4lQaz4fqc9zzYaBDJWHnJHsRujNJw2n3KKVfuPN9gx2W0ovQQf0qpCRxT/kNr0Q4V+1oY1xdfkCjug==@lists.infradead.org
X-Gm-Message-State: APuU4Z/cXfMjl+bkysvJm+PhCsq81jOno8viwJGS9xh3qSL6J3U6T7XT
	venMjzrIT2sFvR0orgR85ykSPC83rNBFMATr6sM5h4b9PgdD9wE5yqYz
X-Gm-Gg: AYBFou0y0iNs7ITPSqvLDS9D6iaMWH6dY2cVx7o7cpBlbzMa2IJ2C8E60EDASZdeesf
	IrMj9bxDvMzqQmR3paRg37nLfqrZnOeDjOxRUTe01r7i/H9weOm6O/SV0rRDIBmjQf2wJQePLSs
	SdO0wBlEp2cf1gvdh4rYRK69QIbddvRfNlbircyDNrMXpXYMF8kGGUySItADg8IZRTTiSpTSP04
	1T23v1K+ojIMEwKTVyl+QEFL+gOZIJVnpAiogBVbbdF1L9WqKQYcuOwehv0xMbmD7JkYuLh8CJO
	msRdjYPnmlDLMJGZcliyCqF1LB1xVuCYGSmVY3B7mL4YrMtTbzZzSfxLNFuUb30Xa+BCKM4o7lv
	XctrYtNRhQDsgO+ipiPJVFC8yJDatE7COsH+IvLM4C49E6hgHtbpYrpShqylv7PEU55LNIsKXAK
	q2Luu1XDgryYx1owXdExpoa3eRErKHI1kROgtlnMBG+t70jJ3B4gsA5a5Fx1Y3ujChn7fY8F+ko
	hsKJuyN3r5M8EUFQQ150n1PRsMN7LQ1JaYrdyZ6chxlZ3a9HRuvpqe0odm9w55dVRRtTG8gV7ar
	Wai1mt/rMT8KNZFd6vqjiySWNC8xZam5s/mY/sEzXTB8SA==
X-Received: by 2002:a05:6808:448b:b0:4fb:ac9b:b076 with SMTP id 5614622812f47-56b9852398bmr834924b6e.67.1794364602109;
        Tue, 10 Nov 2026 18:36:42 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm3756465b6e.13.2026.11.10.18.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:36:40 -0800 (PST)
Message-ID: <ec8e2f41-ffea-4153-a5a0-ea2199bebd74@gmail.com>
Date: Tue, 10 Nov 2026 20:36:39 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sean.wang@mediatek.com, chris.lu@mediatek.com
Cc: mark-yw.chen@mediatek.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, linux-mediatek@lists.infradead.org
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: Request for MT6630 firmware for linux-firmware (btmtksdio, mt76)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_183643_369695_EC8BA25E 
X-CRM114-Status: GOOD (  10.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sean and Chris,

I have mainline drivers for the MT6630 Wi-Fi/Bluetooth combo chip on 
SDIO, written for a 2017 Amazon Fire HD 10 (MT7173). I have MT6630 
support in btmtksdio, and a new mt76 driver, mt6630s. On the tablet, I 
have Wi-Fi working on 5 GHz with VHT80, and Bluetooth plays A2DP audio 
to headphones. I plan on posting them to linux-bluetooth and linux-wireless.

The drivers need three files, none of which are in linux-firmware:

   mediatek/mt6630/mt6630_patch_e3_0_hdr.bin, 47068 bytes
   sha256 c9790255a4e0dacdd6ef9191647fe96c96c30e10f158e9bf15e9ec08a6bab022

   mediatek/mt6630/mt6630_patch_e3_1_hdr.bin, 65524 bytes
   sha256 8a4ed4d384bd14bf255cde87adefe5136742575752e571c39cf49ceef221e6ea

   mediatek/mt6630/WIFI_RAM_CODE_MT6630, 237008 bytes
   sha256 c9715c3f09fbd92afa74bf530c8dea34a0558b463799e4feb3795053402c5558


They are from the Fire OS vendor files for the tablet. Both patches 
carry the build time 20180626b001007, and the chip reports hw version 
0x8a12, ROM version 0x8a11. Fire OS also has an older pair, built 
20170622224023a.

I have three questions:

1. Would MediaTek submit these files to linux-firmware under 
LICENCE.mediatek, or sign off on a submission I prepare? linux-firmware 
only takes firmware from the vendor or with its acknowledgement, so I 
wouldn't send them on my own.

2. Are these the right builds for the MT6630 E3, or is there a newer one 
you'd rather ship?

3. Are the names above acceptable? I'd like the drivers and 
linux-firmware to match before I post the drivers, and I can change them 
to whatever you prefer.

Thank you, and best regards,
Ryan Brue

