Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3563CCD5BAC
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2026 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DK7qqqpT4fnZlS3XGu6aIqnYT1MOPYfSV+g6L0GEpFY=; b=CC9/iJbIz+JoDI4pOStiBdgW8p
	1s0+ExzR7gA/kHK15v+zKvQqub0v3/vsGvLcRRxIlED+BrvstBVrxG0k8+6ORvb0Ah6Acm1bJ9E4K
	k7QwuEbxOrR+8pF+scFNAwi9xeFAXQWNOfAn/H+WBTh2yMkfthxhdetjuXwZyy4jMvaD7m9R67Ptc
	M26SM6Sk3joZpgOGPTX0p5Xr18uK65PMCmOdELE1w9wRaidxbIx90JPllsPzPEwCdnUQHr0f6BAWI
	O0fg2NMAQb6GCRDZedpCzHSzjMgzkIk6YyK4OnNmkRAR/sjzDj1+ye4VA0TtkJxxrU4CmIVvGu9yG
	azVlb9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlGa-0000000DCwg-2T3P;
	Sat, 23 May 2026 12:15:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlGY-0000000DCvj-0BFN
	for linux-mediatek@lists.infradead.org;
	Sat, 23 May 2026 12:15:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ba17c8cfacso84627275ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 23 May 2026 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538541; x=1780143341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DK7qqqpT4fnZlS3XGu6aIqnYT1MOPYfSV+g6L0GEpFY=;
        b=RwziMe8e7D2towCSw6xmjNJvYKYAz76lyMamtjkM3gflKt5dOdbFSXl7UoYFbeDgcp
         Nx+nYfXhkGuihjwvbzHaqSdw5+rzs2pw//rL0WUre/QHzvHG/2aWJmO6inWKXBDJRwen
         oo8NyLPhnmHTrOuUXja57KrjQQD3t6TD7g6Q2xMYFlOG380pyKYiN9ZLOoA0KlU4fauu
         YsMLj0HH7e7+uDFhoCiw0GxqKS1lZQBIE0hcBU6K2KQq6sRTCvyEQ3aKGGxpzaAqf7r9
         b8wE8Stkm61qW/GLEsv+fbZQelIznj6XOx/lEas6y0STpNfjhCuOx5yDfXaYdvK1DUqU
         RVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538541; x=1780143341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK7qqqpT4fnZlS3XGu6aIqnYT1MOPYfSV+g6L0GEpFY=;
        b=jxiujeXMpkfie+MS8D5HjYESPZESs/caHNkhjO7qJaTxIG/eVnmCbFEFHoKjzZJy0T
         qmfGp1tJHg2DeS3zP8r1GtJ1zInjAF3t96JZrkHaNEbI533h14WmEa4/YFRG6bPM6vX0
         vOTV6E8aDwWrbkWG4oEA51XadAJuaoF4M0H8S+gwLRkPToKuYSPZrk2lgXB9ApUUu2ng
         fW8wJsI+Liwshwk8QK/p5lRC5uTJbFrUOzB0NUH8F5Hr6wfgwVQtH5djtpe0FLo3Cfne
         yqqKF60WXEoYVz98LJJnJDnipVHTrgBPC2djecxu8K+Frq+2xlvp+uM2n2gSc0osg6ob
         ebeg==
X-Forwarded-Encrypted: i=1; AFNElJ/9Kcsa4Y5xS5qMJemqN72onaPpbYq2wT3rAGH/xR2lm7lxugI02JlyetfrGC88ty3N8eBn8Dfhe/fDp3LXCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUyBO+C/PzoVQVtiUtX3UgA0fDklQErXMayK6N3AihdlDQGLY/
	r773jF9wETh+gnrT9YTmAevMfJLuITgTlcHa65uF/sFZvJm937nEyTCA2L7kPMJ2
X-Gm-Gg: Acq92OES86JUR8loiV8grKQSOkG42h2F6CMpLSfOMxDmxpZZxoKkD9Vkfg1VTC4smXZ
	8pG4YqlJuTT81J2YCctTHH0UoaZnFcANphs22yddlg/TWZUCc5wgtgKuy+1WNQCjbxofZODZyhG
	pk8OpV3ael72U+JFu+8l6pK/QYZiVsJDt1UWdoBGHPgSvtJLOAnXbnIyjY9Eg+0/3N5ej8ijNsn
	nMXamR3Cs6s3RLt+Cg4QdJWMoSy/Zwz+ek9mtYWdJaB2V5c2zRzPox8b7EcGaQR8IAFh16Rm5Nr
	P/sksM/3WI0/r0g+E7SMUaksjcvVRuSMYGzCzL+nVbDl6eQcUfoWvhRP65jj4BAPlbujzjBYiwk
	jbCz6blS86F62IkTL+Gtwbf45LNEWfzCJgzuTqGWUgzra9lnfKNf6UQhq+xNUPQUVUc/Eq4A+cU
	o/pgRVKBJHNFPJ6aTY+EvSCMTt
X-Received: by 2002:a17:903:388c:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2beb06292f1mr83238405ad.31.1779538540585;
        Sat, 23 May 2026 05:15:40 -0700 (PDT)
Received: from mincom1 ([125.149.177.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce4easm41746305ad.30.2026.05.23.05.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:15:40 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH 0/3] Add packet-mode ESP offload for Airoha/EIP93
Date: Sat, 23 May 2026 21:15:19 +0900
Message-ID: <20260523121522.3023992-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_051542_084513_976DA513 
X-CRM114-Status: GOOD (  13.63  )
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

This series adds the missing plumbing for ESP offload engines that
operate on whole ESP packets instead of only exposing AES/HMAC through
the crypto API AEAD interface.

The normal ESP software path can already call into accelerated AEAD
algorithms, but packet-mode engines such as EIP93 can also generate and
consume ESP packet framing: padding, pad length, next header and ICV.
That needs a slightly different XFRM offload contract so the netdev
driver can hand the skb to a packet backend rather than trying to make
hardware fit the software trailer layout.

Patch 1 extends the ESP offload infrastructure for packet engines while
preserving the existing behavior for drivers that do not opt in.
Patch 2 exposes an EIP93 ESP packet backend for encapsulation and
decapsulation.
Patch 3 wires Airoha Ethernet GDM netdevs and DSA user ports to that
backend through xfrmdev_ops. ESP GSO and ESP TX checksum offload remain
disabled.

Runtime testing was done on a Gemtek W1700K2 running OpenWrt with the
same changes applied on top of a 6.18.31-based kernel.

Test parameters:

  - Static IPv4 transport-mode XFRM SAs between the AP and host.
  - ESP transform: auth hmac(sha1), enc cbc(aes) with a 128-bit AES key.
  - iperf3 TCP test, AP as client and host as server:
        iperf3 -c <host_ip> -P 4 -t 10
  - The host always used normal Linux XFRM software processing.
  - With AP ESP offload disabled, the AP also used the Linux XFRM
    software path; in this setup, EIP93-backed AEAD crypto was still
    available to that path.

Network-relevant test setup:

  - AP: Gemtek W1700K2, Airoha AN7581/EN7581, 4x Arm Cortex-A53 at
    1.4 GHz, 2 GiB RAM, airoha_eth wan (GDM2) netdev, 10Gb/s full-duplex,
    MTU 9200, EIP93 crypto and IPsec packet engine present.
  - Host: AMD Ryzen 9 9950X3D, 16 cores/32 threads, Open vSwitch,
    MTU 9978, backed by a ConnectX-6 Dx 10Gb/s full-duplex link.

AP to host iperf3 result:

  AP offload      Sender          Receiver        Retransmits
  on              918.2 Mbit/s    913.6 Mbit/s    0
  off             782.4 Mbit/s    778.6 Mbit/s    3569

This is a 17.3% receiver-side throughput improvement for the AP TX ESP
path in this setup, with retransmits eliminated in the offloaded run.

Jihong Min (3):
  xfrm: extend ESP offload infrastructure for packet engines
  crypto: inside-secure: add EIP93 ESP packet backend
  net: airoha: add EIP93-backed ESP XFRM offload

 MAINTAINERS                                   |    1 +
 drivers/crypto/inside-secure/eip93/Kconfig    |   10 +
 drivers/crypto/inside-secure/eip93/Makefile   |    1 +
 .../crypto/inside-secure/eip93/eip93-ipsec.c  | 1413 ++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-main.c   |   69 +-
 .../crypto/inside-secure/eip93/eip93-main.h   |   38 +-
 drivers/net/ethernet/airoha/Kconfig           |   11 +
 drivers/net/ethernet/airoha/Makefile          |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |   51 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |   69 +
 drivers/net/ethernet/airoha/airoha_xfrm.c     | 1474 +++++++++++++++++
 include/crypto/eip93-ipsec.h                  |  132 ++
 include/linux/netdevice.h                     |    3 +
 include/net/xfrm.h                            |    8 +-
 net/ipv4/esp4.c                               |    6 +-
 net/ipv4/esp4_offload.c                       |   29 +-
 net/ipv6/esp6.c                               |    6 +-
 net/ipv6/esp6_offload.c                       |   29 +-
 18 files changed, 3324 insertions(+), 27 deletions(-)
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-ipsec.c
 create mode 100644 drivers/net/ethernet/airoha/airoha_xfrm.c
 create mode 100644 include/crypto/eip93-ipsec.h

-- 
2.53.0

