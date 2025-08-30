Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BB7CA0FF0
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Aug 2025 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2SbNmp2jN3W5ifKkr2ZRQIsE+bXPrNXTTlRWUPsyEw=; b=IlEP9zBNtuv3whq086+hjOmgez
	UIGEbXocOTa1Q9JBWp4LHCgUjm8trKIjNC7v78rxsl08MswR9jwLEEU/odnrTOX4ESx3uYjAkzpKh
	rg8R0LUfgfTrNAhX38ZbeYlJoGf1TOul14ImIM5gzBhS+aRru6Qb6CFKbul5e3/dAngPZiOKlTQ6x
	Q8KhMBzyMOP0OpSnBFC94YPa3ToavowLOwDbDu1MNvPhm6kw3OhozEo64+/dQGDiLhe0TH0o5+2gm
	8Mciik25yUB/rw7HhjcRJSxC3Rnn5IA0FZF71NfuLCKFQLijSY67rem37Mqrc7JF0k9WiPoPbcWKF
	k+AEwG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9we-00000007GWn-1uhD;
	Sat, 30 Aug 2025 00:59:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9nr-00000007Bka-1DaK
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Aug 2025 00:50:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-24879ed7c17so20327255ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Aug 2025 17:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756515046; x=1757119846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2SbNmp2jN3W5ifKkr2ZRQIsE+bXPrNXTTlRWUPsyEw=;
        b=Q5QHVAY5mEBUHJAY3/YuUcGcr750/OYuj34HXAnhlsDKLrIPQIc0+TXMAxDdEdTZm/
         I0WBEFIrKzza2Zxs+MGZgAZ7Og0JqnMlbVbWIycP/2KFpNhmWW9wk95FsMkNQ96akoGz
         HGGLwPi0ipf8tdiZWgaEdwnfnMB4zTbeXlTpX+Z1a7mGVqB6soTLDI47W2RRCSpvQBc6
         oIRxi6K+mc6xWanAnMvMJaA27ecYVsBHaBCEyCuKKmRcAdmdVjiKuPc3rtJwTTXq/a5e
         OqhSF00Gkp57NlvuGkT2/uvzhaZSMr7hjlfUBzjlNjGZH0VSuFZUliC8MZIYlIdxa0JM
         w9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756515046; x=1757119846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2SbNmp2jN3W5ifKkr2ZRQIsE+bXPrNXTTlRWUPsyEw=;
        b=IQwfkvky2ivEZh3NEROASXIp3aLShmwbK6gZ4xiJTE4zW5EADDe/5Nm63ptSjj/cxf
         S+LYswxZdcbnO+Fp38RNoOEv37QWrHPhnm25oLF697RLVbwQTeLsStu8pbYBdJRJN/KS
         AHrWCWvXQbrx3G6WmSgDFQ6Rj7VDbt8QhsyijFu0hJugizrTYnhU4RK3WRWOtatYaNyF
         mKrdjjEZ8hC2jvFzXrPEDcWeRZv2lp8momODzeEQu13TUzH5jvgT0tglI1fbXFTwqUFa
         asimvmuLc9LS/UpYCPJ4sxNwMZYVG1N8KEfkG4/V9+IZzg6ILCUA7qASjn/wO10oU4ru
         T9mw==
X-Forwarded-Encrypted: i=1; AJvYcCVhemSy+yA7vtJ6xNy5EhQpD9dTCN6zQZYvsOc1AKW+BnY/pNKqso+6hYQD2HamiyhldxSMZYV0oTxqT08JtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZQjF+YYqn+FYaHOshc6PXfZrvce/PITdMGgCRmbQ2Z/9kgVQ
	TdrvshAndXrGlJ6CoUffC5tHefD2CnV9BOfZ2ziJgkf1Eeb75AR70jpAtfN3QW8metU=
X-Gm-Gg: ASbGncvIQ3ugKPiZfwlR8aDRa3PMql0g8gGJ0JjG3bA0VbErn1zYWwhYai5AwkjjLVc
	ayV+sH3rHodGh7Cejo4EZ1IBxE/x3XHderFRIDYSqyfziPCk/ITs4JNlVpH6NIVywA1o3aTDFyv
	IkvRyoVi7/Ia4GGVOOoL1WP3MLC12SRibLsfN9+ub8/DW2okGX54Hg3es9Lo5HCDQ3ARerzeDAq
	F8QKCsbPfBC+N8hxG+HVVizP/QtRle4KNFgCgQawZYp5Y8BMUhyLtrSB7L88iRPprA1oCbarjlr
	QCm5RJAEQBQeAjsFAJpIkMYk7q9EXP2vLGLEQBP4TYE79PIjnNZH3bxN819z+usPAmANRcjC+V1
	QCHq2C7v3cAUyMt/bjAOM5Vu7
X-Google-Smtp-Source: AGHT+IEgjacSF3MiNjBgqMzAV1pQjZuDMZIwv0mu4RkXIH4CsWBoPGHGROsvLiA4PPniQpoHC2qUVQ==
X-Received: by 2002:a17:903:190:b0:246:e8cc:8cef with SMTP id d9443c01a7336-24944870a4emr8537915ad.3.1756515046144;
        Fri, 29 Aug 2025 17:50:46 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249063961desm37008335ad.103.2025.08.29.17.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:50:45 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
Date: Fri, 29 Aug 2025 17:50:29 -0700
Message-ID: <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <202508300413.OnIedvRh-lkp@intel.com>
References: <202508300413.OnIedvRh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_175047_334762_F9FF99FD 
X-CRM114-Status: GOOD (  12.38  )
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

Syzbot found a randconfig which fails after my recent patch:

    drivers/bluetooth/btmtksdio.c:442:33: error: array type has incomplete element type ‘struct h4_recv_pkt’
      442 | static const struct h4_recv_pkt mtk_recv_pkts[] = {
          |                                 ^~~~~~~~~~~~~
    drivers/bluetooth/btmtksdio.c:443:11: error: ‘H4_RECV_ACL’ undeclared here (not in a function)
      443 |         { H4_RECV_ACL,      .recv = btmtksdio_recv_acl },
          |           ^~~~~~~~~~~
    drivers/bluetooth/btmtksdio.c:444:11: error: ‘H4_RECV_SCO’ undeclared here (not in a function)
      444 |         { H4_RECV_SCO,      .recv = hci_recv_frame },
          |           ^~~~~~~~~~~
    drivers/bluetooth/btmtksdio.c:445:11: error: ‘H4_RECV_EVENT’ undeclared here (not in a function)
      445 |         { H4_RECV_EVENT,    .recv = btmtksdio_recv_event },

...because we can have BT_MTKSDIO=y with BT_HCIUART_H4=n, and the
definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.

I think the simplest way to fix this is to remove the gate on the
definitions in hci_uart.h. Since the constants are macros, there's no
runtime cost to doing so, and nothing seems to rely on their absence in
the BT_HCIUART_H4=n case.

I let randconfig builds run for awhile in drivers/bluetooth/ and didn't
hit anything else, so hopefully this was the only fallout.

Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/hci_uart.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 5ea5dd80e297..fd0624988aba 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -121,7 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
 void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
 			 unsigned int oper_speed);
 
-#ifdef CONFIG_BT_HCIUART_H4
 int h4_init(void);
 int h4_deinit(void);
 
@@ -165,7 +164,6 @@ struct h4_recv_pkt {
 struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
-#endif
 
 #ifdef CONFIG_BT_HCIUART_BCSP
 int bcsp_init(void);
-- 
2.49.1


