Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF2CA0FFE
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Aug 2025 19:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHChkfQMkbV7SjUtwakYhLoytq+CyhHZTNbhfb0dUvg=; b=Q8RbJ46TpREdzrpD1ZIX7skXlT
	bx95rZkFWhm9bPHMJZhcGgb88EurmVqITjgVTiWETt4qM4+zw0z3BleLzN93YrZZkCLR82GOcQhqw
	AtRGs5fSZcQfpkG6xB3XGajiRkJdnTtE56E1XcpnUR2efPPMTcFeMgXWVjc2AZIHVx4CvXF768CWf
	q3oorpaPnJlt9l6R3gKcec7V3EDQ4z3m835eTPXjIRq71uPlUpEArOTusSwkUPwAi6mMn1swgN3Fo
	8IgH2RcR06h1bl9tLRoz7f7Kq0bvzpTMFwl4oKOFdvtwlKwFnBuyfxWdLUUdRq9sPER5HYh/zdiIb
	5tsESWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRVp-00000008NV1-1vk2;
	Sat, 30 Aug 2025 19:45:21 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRJD-00000008Mal-2tq6
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Aug 2025 19:32:21 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so1083766a12.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Aug 2025 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756582339; x=1757187139; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHChkfQMkbV7SjUtwakYhLoytq+CyhHZTNbhfb0dUvg=;
        b=dqoLXDB9ptrscWcwG8GWYapQmLO4vmht4EXfKfE7ECIIZNzSWMkGeX+ayIvoaZ7I4c
         z3+EfO6sPeYdxuaPnS5H1SuXP3bkxX5SnLjNPVy8ugjmcSyamlFwvI1jSMilN8DS6oIv
         NFlKDheUYSDmHjh0bCpXoRlxuGXN5rl6VVZggVrOcUKFkWbIyZPh/CP2WIc6O+l1RXt1
         siXUHuYgDDftIk/wXrMOPdQ3XECFHAD6m234uS3om7VkKeSOyYFRO5sOt444PAXq4VC/
         I5Y3aAFmr82qfQkRM7bOKUfpLxxuoEACYMAdU2lI963ofk6/MXxFJRjaXGCdu6TCv45z
         pEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582339; x=1757187139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHChkfQMkbV7SjUtwakYhLoytq+CyhHZTNbhfb0dUvg=;
        b=hi3Yo0uQz8YVGgluA1YQnhQe7MMouiCcbLwIpfoOtMhSONSGaprdGhBV+DPH6IcKYE
         ObAGmShj1hs2T887H1XoXH9+1XnXxz7vO+QEziE9xMoQCMWfURXMssk1nVMmAVjVgSPH
         lxE0AKOkyLZH6hhOt0o52AQv7gWeZSMh7JOSwWBhhIVkmQeFRs7v/h+66AlkK0D9lcSP
         Zcw1wQQLPDIkizyFEyuPsw0FkwG8zSc3cqzMJ3w8ojkrP7dtt1ty0PTMqsKjKNvWJdL0
         JQ5OL1Car6qLB8tqHzG1pBm+F8gBtJSiRHfy/ko0f0pqgYKkmLTtq+VcjFKGpU1ko1xA
         8WQA==
X-Forwarded-Encrypted: i=1; AJvYcCV2zqiQrwR92nyiD9x2+SYEuYgvkiEfjE6k8QBH+Do7W04ZSVeYR66ii0xj88evOc8LhzcHhmwvXku+rl7rXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNgCqyAl5DhCn72WNlmN2v7UDoUNdsC0ey8CirFOkY4MNply/6
	b6rAyl49WmW0C0Y5qjQSKnid4n/v9oPh35IALSysOobTlVb6TNWyOPWqd6lNoEBYOWcQyZ4z/n6
	5nqF+
X-Gm-Gg: ASbGncsi0I5g1HGVFwHYs375iXv+SLJnuaqM3iwXhOjdziVBPzNWdtAISmOS6FYOUZB
	RnwqATgdvM8wGUEpdiytaz6CKZ87vhWWX/KAbSn3jCrAJSADkcie4DUWXaFwkopvOJnnDPK9PFN
	o6h70Y434r5ebLt/bbN4uWhdr8bzksU4o+okjjv06i7Oy5k/IOm1W/IvsGzxz42wWsxaxSWKLKJ
	R/miiOJpJeSTyAh2+UrddipHCtnziIXRgLGbo46gG9gpJgzuO0Tf3/acyfguEdTpclHtOaCjWyn
	X2NNc9PdgoaAUAbGV/2zB4Ze2dacV3OeyrFQJHnHE4+qZ7bF7vPAudW8zg7s3AHsP+mXpMdjztJ
	LNC9+8ITkvaxqiKsrRTOkG++B3i049U/6nQk=
X-Google-Smtp-Source: AGHT+IH+3miFeIR6tQUL0wfehVSxT31HOSJPjvKC8CX71Xx5VWWJuBvRY0vS/CA50IGWE4dB1x1ywg==
X-Received: by 2002:a17:902:ebc9:b0:246:b15f:8d9d with SMTP id d9443c01a7336-24944a1ca58mr35922805ad.14.1756582338796;
        Sat, 30 Aug 2025 12:32:18 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903702396sm59584335ad.14.2025.08.30.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 12:32:18 -0700 (PDT)
Date: Sat, 30 Aug 2025 12:32:15 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
Message-ID: <aLNRvzXE4O9dKZoN@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_123219_737170_B2ED2C89 
X-CRM114-Status: GOOD (  28.77  )
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

On Saturday 08/30 at 07:11 +0200, Paul Menzel wrote:
> Dear Calvin,
> 
> 
> Thank you for your patch, and addressing the regression right away.
> 
> Am 30.08.25 um 02:50 schrieb Calvin Owens:
> > Syzbot found a randconfig which fails after my recent patch:
> > 
> >      drivers/bluetooth/btmtksdio.c:442:33: error: array type has incomplete element type ‘struct h4_recv_pkt’
> >        442 | static const struct h4_recv_pkt mtk_recv_pkts[] = {
> >            |                                 ^~~~~~~~~~~~~
> >      drivers/bluetooth/btmtksdio.c:443:11: error: ‘H4_RECV_ACL’ undeclared here (not in a function)
> >        443 |         { H4_RECV_ACL,      .recv = btmtksdio_recv_acl },
> >            |           ^~~~~~~~~~~
> >      drivers/bluetooth/btmtksdio.c:444:11: error: ‘H4_RECV_SCO’ undeclared here (not in a function)
> >        444 |         { H4_RECV_SCO,      .recv = hci_recv_frame },
> >            |           ^~~~~~~~~~~
> >      drivers/bluetooth/btmtksdio.c:445:11: error: ‘H4_RECV_EVENT’ undeclared here (not in a function)
> >        445 |         { H4_RECV_EVENT,    .recv = btmtksdio_recv_event },
> > 
> > ...because we can have BT_MTKSDIO=y with BT_HCIUART_H4=n, and the
> > definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.
> 
> The drivers below seem to be affected:
> 
>     drivers/bluetooth/bpa10x.c:     { H4_RECV_EVENT,   .recv =
> hci_recv_frame },
>     drivers/bluetooth/btmtksdio.c:  { H4_RECV_EVENT,    .recv =
> btmtksdio_recv_event },
>     drivers/bluetooth/btmtkuart.c:  { H4_RECV_EVENT,    .recv =
> btmtkuart_recv_event },
>     drivers/bluetooth/btnxpuart.c:  { H4_RECV_EVENT,        .recv =
> hci_recv_frame },
>
> > I think the simplest way to fix this is to remove the gate on the
> > definitions in hci_uart.h. Since the constants are macros, there's no
> > runtime cost to doing so, and nothing seems to rely on their absence in
> > the BT_HCIUART_H4=n case.
> 
> Looking at the implementation, it looks like they only work with the H4
> protocol? So maybe, that should be denoted in the Kconfig files?

Thanks for looking Paul.

Yes, my fix will cause a link error with other randconfigs, which my
'make randconfig drivers/bluetooth/' test loop missed after I made the
function prototype always defined, whoops.

We do need the dependencies here, as you note. The btmtksdio case syzbot
found is the odd one out because it only uses the constants, and doesn't
call h4_recv_buf().

Hopefully this gets it all:

-----8<-----
From: Calvin Owens <calvin@wbinvd.org>
Subject: [PATCH v2] Bluetooth: Fix build after header cleanup

Some Kconfig dependencies are needed after my recent cleanup, since
the core code has its own option.

Since btmtksdio does not actually call h4_recv_buf(), move the
definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
avoid adding a dependency for btmtksdio.

The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
h4_recv_buf(), so the dependency is required, add it for them.

Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/Kconfig    | 6 ++++++
 drivers/bluetooth/hci_uart.h | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 4ab32abf0f48..7df69ccb6600 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -312,7 +312,9 @@ config BT_HCIBCM4377
 
 config BT_HCIBPA10X
 	tristate "HCI BPA10x USB driver"
+	depends on BT_HCIUART
 	depends on USB
+	select BT_HCIUART_H4
 	help
 	  Bluetooth HCI BPA10x USB driver.
 	  This driver provides support for the Digianswer BPA 100/105 Bluetooth
@@ -437,8 +439,10 @@ config BT_MTKSDIO
 
 config BT_MTKUART
 	tristate "MediaTek HCI UART driver"
+	depends on BT_HCIUART
 	depends on SERIAL_DEV_BUS
 	depends on USB || !BT_HCIBTUSB_MTK
+	select BT_HCIUART_H4
 	select BT_MTK
 	help
 	  MediaTek Bluetooth HCI UART driver.
@@ -483,7 +487,9 @@ config BT_VIRTIO
 
 config BT_NXPUART
 	tristate "NXP protocol support"
+	depends on BT_HCIUART
 	depends on SERIAL_DEV_BUS
+	select BT_HCIUART_H4
 	select CRC32
 	select CRC8
 	help
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 5ea5dd80e297..cbbe79b241ce 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
 void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
 			 unsigned int oper_speed);
 
-#ifdef CONFIG_BT_HCIUART_H4
-int h4_init(void);
-int h4_deinit(void);
-
 struct h4_recv_pkt {
 	u8  type;	/* Packet type */
 	u8  hlen;	/* Header length */
@@ -162,6 +158,10 @@ struct h4_recv_pkt {
 	.lsize = 2, \
 	.maxlen = HCI_MAX_FRAME_SIZE \
 
+#ifdef CONFIG_BT_HCIUART_H4
+int h4_init(void);
+int h4_deinit(void);
+
 struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
-- 
2.47.2


