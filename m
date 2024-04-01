Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FECD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RvYbbHjPyiORsf1A18YXo9DewRsvfmOj39Pus78xSY=; b=TkXeQQZlNCA6RKbPazH/BThgBr
	7WoDz6DR7+WROSXIBE51T88y14ryMxEZXBb1Xz417BLIU9bX5AO6Zu2akFw1mcog65FuUubTbNrJg
	XouFBemC6E5lK/aKJWEH9MeoQlY4QaEcSmUaIDByrM/uHZQrqeUy6YKBXM/lhqoMBu/A0btClc6Fq
	95N1nf7MGnuVvPH0oKoHo+WptIhyA7Kla5iGUcYH16dDO4iNnCbDBHFiPCsWv+FGW8uWioPbiypKW
	wnDqNLpoX9CjH2e3o9TDHvpv4SHQP0KE/fpqFnki56WRp/Yxnlz1dp7T1ofVCSFUvgfBhhB7QNV7d
	gK7wc+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrItr-000000085RQ-3nL8;
	Mon, 01 Apr 2024 14:44:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIto-000000085Qz-1oJ7
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Apr 2024 14:44:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4156e0cffdaso1586385e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Apr 2024 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1711982674; x=1712587474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RvYbbHjPyiORsf1A18YXo9DewRsvfmOj39Pus78xSY=;
        b=iTW1XaeKt9KLPYNE///llTBFVB8dXR20PaIMPbPQuNRKXb4+SUl81VeXQqjFyTN+Tf
         ZBc6kZySFJxnNExPXyYWBhHeL0RcE/kDSE9/lbV6b7cKmMBeFjF8asbo8Ouwz8YOf7YJ
         GAYzxKqlcKwCg6fYORkeQmCdZIzVddNEx+dfHthF2gCeTYgb4SKVaF8XzPzuNrDwyga5
         TzNA9yX+drlUMfCmjedhZ8yT/s9Pjw/bUKmlYy2zFbnrM1LqJj3qt5IsSh3qqQJ5hEih
         3gUEgEF6+QXfDxjf2PQh7VyAI4o8Mso5AWVeFCdUFn1OfDa0ENQTkD8a6YfWpI94hOuG
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711982674; x=1712587474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RvYbbHjPyiORsf1A18YXo9DewRsvfmOj39Pus78xSY=;
        b=OkNiGCdbqiV2p4mJf0AFV7YN1krDuIWmyruGfj6IwM/M6QgLxokIHY0dp4LruMqo0f
         Exjdn/X2yAS4QooauEuUlSMVFTQAhwN8EQGAiuCQ4GDvibE/80RDNBespo6hg9EEH0mR
         pIiX3DFSKbB1aJ+KTWREbjRhzcmzVIC0J/Rm3lWE4t5E0zx5ayk89wlSP5LevpFw+bbI
         as6djSemX+PAuW8TpjZwz8+jdxs9uUDJrbB0t5tFMpF80olti24SOCzoj9iQHzD59FD6
         PgMb8CAaxl9VFbgcgMycP/W2tH5yJ0i9LeHafbnGkqnQmXp/hnZtTpezS8r8rVaA8BcQ
         UqcA==
X-Forwarded-Encrypted: i=1; AJvYcCUk+aO2GX85+Ql6iDbNev4LXZUtWyR5+IfwoQa57MUCXJmkFd4CYAiendoeRfAiLRjPOI8P7fIGHqRnU1ftFP2crl3kHPLud9bIoAlmHZLWMG3J
X-Gm-Message-State: AOJu0YyEXykKDPUlyO2ZEuFBpWQNVmmj5iKvJ2+KS53Gn3uKlZDryI7i
	ZfEy5POL+1L+5iJK61Yz1l/7JSagf/af+r3x4CEDEY651WfFwM1SF8zWZ2YTl+3dn2gVdlb5ep3
	o+VJs
X-Google-Smtp-Source: AGHT+IHFwTeHa3eLF0iSWmR3ZRa9CNqiw+F/uWJvheTXNwpRf9+4QL+uhvTDDxHrRzI6a2UhU6K3YQ==
X-Received: by 2002:a05:600c:35c1:b0:415:6b9a:326d with SMTP id r1-20020a05600c35c100b004156b9a326dmr1118098wmq.4.1711982673860;
        Mon, 01 Apr 2024 07:44:33 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:cf6f:1e76:917a:6efb])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b004156c8d0530sm1258026wmb.13.2024.04.01.07.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 07:44:33 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: peter.tsao@mediatek.com
Cc: aaron.hou@mediatek.com,
	chris.lu@mediatek.com,
	deren.Wu@mediatek.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	sean.wang@mediatek.com,
	steve.lee@mediatek.com
Subject: Re: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920
Date: Mon,  1 Apr 2024 15:44:24 +0100
Message-ID: <20240401144424.1714-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304144844.2042-1-peter.tsao@mediatek.com>
References: <20240304144844.2042-1-peter.tsao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_074436_717659_38F9918A 
X-CRM114-Status: UNSURE (   7.42  )
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

Hi

I think this patch is cauisng issues with older firmware

Bus 003 Device 002: ID 13d3:3563 IMC Networks Wireless_Device

[    0.315064] Bluetooth: Core ver 2.22
[    0.315064] NET: Registered PF_BLUETOOTH protocol family
[    0.315064] Bluetooth: HCI device and connection manager initialized
[    0.315064] Bluetooth: HCI socket layer initialized
[    0.315064] Bluetooth: L2CAP socket layer initialized
[    0.315064] Bluetooth: SCO socket layer initialized
[    4.670811] Bluetooth: RFCOMM TTY layer initialized
[    4.671029] Bluetooth: RFCOMM socket layer initialized
[    4.671790] Bluetooth: RFCOMM ver 1.11
[    4.673416] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    4.673659] Bluetooth: BNEP filters: protocol multicast
[    4.673895] Bluetooth: BNEP socket layer initialized
[    4.674125] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    4.674360] Bluetooth: HIDP socket layer initialized
[    5.016365] bluetooth hci0: Direct firmware load for mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin failed with error -2
[    5.017163] Bluetooth: hci0: Failed to load firmware file (-2)
[    5.017557] Bluetooth: hci0: Failed to set up firmware (-2)
[    5.018129] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.

The correct name should be mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin

Reverting this patch fixes things

Cheers

Mike

