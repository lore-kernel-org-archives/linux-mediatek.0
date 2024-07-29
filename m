Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6F2C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jssj0R5WbBD/D0bXekdzCX19Oz7kjShtw75YWSFqWPc=; b=zD3nFLP2vjK7fCuLWCTiqyu+1I
	9Hu+Rtr+zYpaJq5Kbi2Gov2Z4/yl4itjpM4s57A/YwrMwYDrmsEmHUFKpll1/nVuryOo2i2C3r7HV
	z6Jb+Ls406mkFFR/uNNaBS/6KHdhv19qrLzsHJln+kt+BEfCHEiAtGbIPMQWtVKkhOibOYdqQYXjh
	O5htg0yB2mEB6ZCJdWHfbDdn6XMFTedgo6mqov8AVIVN3y9jUFzTKktHmAcyG0k/cF9rLXdrrGYun
	aGONamO0e4r+HdCAZK2KXPNQkQkbWfXpEgq4Hb/q3Xey4cf2/NQjCEiGUZnBfPS7dk3YI7H2CUpBX
	z508a5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYV9h-0000000CLvh-31GV;
	Mon, 29 Jul 2024 18:31:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYV9F-0000000CLpK-3s70;
	Mon, 29 Jul 2024 18:31:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-36887ca3da2so1571060f8f.2;
        Mon, 29 Jul 2024 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722277864; x=1722882664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jssj0R5WbBD/D0bXekdzCX19Oz7kjShtw75YWSFqWPc=;
        b=F/fvR7zTZztQ9EsxETUUE+GTr8Ncm/XWNjeA4AjQFXPAHjQ6NM1x0Vz8tnMM5U81vS
         nxDpt/3YgUEhoDcb607O6a9J1f82vcvsDm1BZdl0p/rr/HiY3VFgc2N2MsjT7PsdLspk
         XjyO46KrU8Ldt/rUyQK6t3GAjSVbLYvCNTTUOc/cQRerVPLfZHgfM5956H/QIBhCTuOx
         AAxycYi+eSIfBEsOukbhf27QPrPtr/HsswYUVq3lwDw2Aos/RC0A3wjuRPoxHounZpB+
         RFZGMXbHt6nROsiPqesnMy16LkSlW2Tfcx3D9K8DYxNEVIp517K4nlE7ssMHAZ1kZEn3
         zXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722277864; x=1722882664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jssj0R5WbBD/D0bXekdzCX19Oz7kjShtw75YWSFqWPc=;
        b=HfByoTi1j+GZn7CcD/9Nj7RaoWMcCbdPKS7XXeXJd/nM5YgG2xgQSNC7odSmWJIexn
         Sbuwylfnf/IebUL18wZcNmGwOEQGxLSQuM147EqwBtVA0I9pVc0uxCMY4cfo9dR+SfYB
         FuICSNztlvN3H+s4mSHWMIizJRe8yk/fy2ZEcU+0we9Ho4bgfoG6EOoe6GQKnhE3CZVV
         Ok3ldIRQWDc/2E1ujCb4VDyW1KMPcByi7wkmT+tXLweY2wqJNr8cZT5W0EXWVL6FvEdD
         vWpRYymj82P82b4GimoN+pDz/tKf8R/WKgtmRhpqQNriwuC24ptSNcF8eo1ofFRwUzgi
         80sg==
X-Forwarded-Encrypted: i=1; AJvYcCWF8A1s+go3N5P3XG2xxETpbXqLfGvlyyp3yBifiv2QM9fvn/CxnWd2dxot5tkHzzciSYxRrEADX8CigeX6NNZGrgofBFlsIp7TKFXqG+hjpAqKmyQq1KxE6KI9EJVot/mXZ4HXWrDqe+r0Ljr5pWrHQ5qLbTse11c=
X-Gm-Message-State: AOJu0Ywm5Q9woiLu4dfmP3UxZM24U5RkOTO3OnWtrcLmq0OqPGmwSr/b
	3TtnYDqEK6wkoMCB8RmhtRn4X0kQG1UTqVNYT7rC+KeIDf/2yca06C2+9AJk
X-Google-Smtp-Source: AGHT+IGckqeV7E3QtAQI0Wo2goxFEwu/asovTfRvWoVzIEz3+nSxwluR1w5l8j0bg8XNacAX40nuXQ==
X-Received: by 2002:a5d:62c4:0:b0:368:7f58:6550 with SMTP id ffacd0b85a97d-36b5ceef410mr5313692f8f.15.1722277863270;
        Mon, 29 Jul 2024 11:31:03 -0700 (PDT)
Received: from yifee.lan ([176.230.105.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0aa1sm12800165f8f.21.2024.07.29.11.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:31:02 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Elad Yifee <eladwf@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>
Subject: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX performance
Date: Mon, 29 Jul 2024 21:29:53 +0300
Message-ID: <20240729183038.1959-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_113106_013087_441E1CC3 
X-CRM114-Status: GOOD (  11.11  )
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

This small series includes two short and simple patches to improve RX performance
on this driver.

iperf3 result without these patches:
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-1.00   sec   563 MBytes  4.72 Gbits/sec
	[  4]   1.00-2.00   sec   563 MBytes  4.73 Gbits/sec
	[  4]   2.00-3.00   sec   552 MBytes  4.63 Gbits/sec
	[  4]   3.00-4.00   sec   561 MBytes  4.70 Gbits/sec
	[  4]   4.00-5.00   sec   562 MBytes  4.71 Gbits/sec
	[  4]   5.00-6.00   sec   565 MBytes  4.74 Gbits/sec
	[  4]   6.00-7.00   sec   563 MBytes  4.72 Gbits/sec
	[  4]   7.00-8.00   sec   565 MBytes  4.74 Gbits/sec
	[  4]   8.00-9.00   sec   562 MBytes  4.71 Gbits/sec
	[  4]   9.00-10.00  sec   558 MBytes  4.68 Gbits/sec
	- - - - - - - - - - - - - - - - - - - - - - - - -
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-10.00  sec  5.48 GBytes  4.71 Gbits/sec                  sender
	[  4]   0.00-10.00  sec  5.48 GBytes  4.71 Gbits/sec                  receiver

iperf3 result with "use prefetch methods" patch:
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-1.00   sec   598 MBytes  5.02 Gbits/sec
	[  4]   1.00-2.00   sec   588 MBytes  4.94 Gbits/sec
	[  4]   2.00-3.00   sec   592 MBytes  4.97 Gbits/sec
	[  4]   3.00-4.00   sec   594 MBytes  4.98 Gbits/sec
	[  4]   4.00-5.00   sec   590 MBytes  4.95 Gbits/sec
	[  4]   5.00-6.00   sec   594 MBytes  4.98 Gbits/sec
	[  4]   6.00-7.00   sec   594 MBytes  4.98 Gbits/sec
	[  4]   7.00-8.00   sec   593 MBytes  4.98 Gbits/sec
	[  4]   8.00-9.00   sec   593 MBytes  4.98 Gbits/sec
	[  4]   9.00-10.00  sec   594 MBytes  4.98 Gbits/sec
	- - - - - - - - - - - - - - - - - - - - - - - - -
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-10.00  sec  5.79 GBytes  4.98 Gbits/sec                  sender
	[  4]   0.00-10.00  sec  5.79 GBytes  4.98 Gbits/sec                  receiver

iperf3 result with "use PP exclusively for XDP programs" patch:
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-1.00   sec   635 MBytes  5.33 Gbits/sec
	[  4]   1.00-2.00   sec   636 MBytes  5.33 Gbits/sec
	[  4]   2.00-3.00   sec   637 MBytes  5.34 Gbits/sec
	[  4]   3.00-4.00   sec   636 MBytes  5.34 Gbits/sec
	[  4]   4.00-5.00   sec   637 MBytes  5.34 Gbits/sec
	[  4]   5.00-6.00   sec   637 MBytes  5.35 Gbits/sec
	[  4]   6.00-7.00   sec   637 MBytes  5.34 Gbits/sec
	[  4]   7.00-8.00   sec   636 MBytes  5.33 Gbits/sec
	[  4]   8.00-9.00   sec   634 MBytes  5.32 Gbits/sec
	[  4]   9.00-10.00  sec   637 MBytes  5.34 Gbits/sec
	- - - - - - - - - - - - - - - - - - - - - - - - -
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-10.00  sec  6.21 GBytes  5.34 Gbits/sec                  sender
	[  4]   0.00-10.00  sec  6.21 GBytes  5.34 Gbits/sec                  receiver

iperf3 result with both patches:
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-1.00   sec   652 MBytes  5.47 Gbits/sec
	[  4]   1.00-2.00   sec   653 MBytes  5.47 Gbits/sec
	[  4]   2.00-3.00   sec   654 MBytes  5.48 Gbits/sec
	[  4]   3.00-4.00   sec   654 MBytes  5.49 Gbits/sec
	[  4]   4.00-5.00   sec   653 MBytes  5.48 Gbits/sec
	[  4]   5.00-6.00   sec   653 MBytes  5.48 Gbits/sec
	[  4]   6.00-7.00   sec   653 MBytes  5.48 Gbits/sec
	[  4]   7.00-8.00   sec   653 MBytes  5.48 Gbits/sec
	[  4]   8.00-9.00   sec   653 MBytes  5.48 Gbits/sec
	[  4]   9.00-10.00  sec   654 MBytes  5.48 Gbits/sec
	- - - - - - - - - - - - - - - - - - - - - - - - -
	[ ID] Interval           Transfer     Bandwidth
	[  4]   0.00-10.00  sec  6.38 GBytes  5.48 Gbits/sec                  sender
	[  4]   0.00-10.00  sec  6.38 GBytes  5.48 Gbits/sec                  receiver

About 16% more packets/sec without XDP program loaded,
and about 5% more packets/sec when using PP.
Tested on Banana Pi BPI-R4 (MT7988A)

---
Technically, this is version 2 of the “use prefetch methods” patch.
Initially, I submitted it as a single patch for review (RFC),
but later I decided to include a second patch, resulting in this series
Changes in v2:
	- Add "use PP exclusively for XDP programs" patch and create this series
---
Elad Yifee (2):
  net: ethernet: mtk_eth_soc: use prefetch methods
  net: ethernet: mtk_eth_soc: use PP exclusively for XDP programs

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.45.2


