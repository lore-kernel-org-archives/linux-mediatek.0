Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151C4CD5BBF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2026 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUftknpjAzJRHNFFrDtQsWg7bJX0Pe38bqsMwsZfQGk=; b=28znVY+VWgHuxG12I5uPxpQcii
	BsaifEdht0paTZuZdBRTCg803/0lzg3L8no3LwDHtm9AASyQkpmz2n24D+sbMGIevJk9hrO/jLkBn
	u0ccC807cIOxXecOzyUKDjZ/w1WDOBkTk6YbWvPnNFjoquQfix0Md8EmYCf7Ub+Yxe+6wcbCsTHNR
	fsEL+y2cI4aGgWBCDfgZwCsKXythMYwlXxVWq0uc0BZrL2Vq7CrFzJCJdCWErMR08OFIS1i48/RyR
	4FlsX1HMcOwFoUs+SrJEApWjaEJyS+JObkoU2zX1koPT/e5Pa+fkchvTCG4jtc78Mb0HsFl1K/+ua
	3kbmdigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlOi-0000000DE9L-0cwN;
	Sat, 23 May 2026 12:24:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlOf-0000000DE8W-30Cy
	for linux-mediatek@lists.infradead.org;
	Sat, 23 May 2026 12:24:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba17c8cfacso84685065ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 23 May 2026 05:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779539045; x=1780143845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUftknpjAzJRHNFFrDtQsWg7bJX0Pe38bqsMwsZfQGk=;
        b=SKtbNuZ+91ziXrPEqEK3s49PwwifuxAGUeLpuM9mTsNdrsQztuwCSSlI4hbLO5sPrP
         UVynnpBppW6yTaAXP9tniMXvZp2i77kKvpHlsfH2eO8oNOH4LKm11OJnKiT29Jn2HNOH
         i9MzX6U34ckfLFwnJu3N8a8YmM7shCFI/HnWrCbc5zeMPyQ+PJQlnXRraJe3H0NWFdHY
         sS9X6+Mx507SkY0wpjfeTcMd6frEjing1fFJcsQ60rNUM22sMEf1Qtn+PAyA7R1RVBqX
         TSBdmSg5DVu8PufGRQoroP5eQ6fsGY2KtLjIv4acyKpBwcPsD0mMJSqIj4jEsOTK7P21
         C6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779539045; x=1780143845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUftknpjAzJRHNFFrDtQsWg7bJX0Pe38bqsMwsZfQGk=;
        b=px4R/6sgOSQQuh+m1VLCvt2HNCR5p1/jvqECOBUZji0GAO69T6XOO4xhUxbLdJkHik
         W22xzgKuUIZIhHbp1mVBVpmdHspioaABknUkYkD5NvkmOokhCnzZqVCA2x+8Qd3BMpxb
         mPWXtKDEqZby2iiYMRErMc+J4/0JJbvPZVOtOOPxzi6ILZFa31o+ARDBisB1sKQIRav4
         TTftFAxxWMYIyQVY4gWqVX5GztOU6gdzSmzptaH31WiaUhpnGueqNPGbGe3VBcMaXYDx
         IDsYcwxQZTpK9FIu5VU8MDVqEXOKVnpytXT9cg94LjiltU0rUjWSb8jeXUQQ3y3790P1
         0BTw==
X-Forwarded-Encrypted: i=1; AFNElJ8dHhX19YF9LHD+d2/jDYnH6IOy1NxCBqdCFxuPxZbqCP4beRWtuZV36T0zvZaHWKOfl9miOrppjus2FZOqRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIriTLNYclDBvifwat/XGyOBkSl9PpWppljR1XqBGWTidmV+bE
	r59v/iJAk9ZsiNto+HmHZoaJFMF4r1fn05xGMABnQipZk7Zf3akqk+d6
X-Gm-Gg: Acq92OHQd+2T/RFGyeKhSJajsfiIHXgFUDuB3S/+sG9f6Ql/u1GAxiyjYy0m2i5fHsb
	L9PFrMvMPKx33709bpAw/Vc5waN+znf5+V+mw6gPOVNgbABTaLHyQFO8UdXlPOvK9juV0DDLqYa
	IhaeeWEDsAPwSMhDqpuNPz2tSQXJOs8wErLWIMKvKEgilvdgyuOCPfglavHWxbpv6JZOl9nI9PL
	ikuCzfE2ZohwTid9BROt5zyWBpcjPQ188S5hGOyN6vwAT+jLMDIDqLMFk3Anq2uV6oI1zU9GxLE
	tNJSV6IeQABLGHTODYrw9ORriMWgt1yLizK+dVj/CC0VQP7y1Kl8+90QgzTm/+oGs8hJGJADeyK
	Gghrt/Ub/RUIbeEaBLzOuCR8UTW4Xb2chiH/qqrhyeBD+hyVrP6Vzp5I0bPtJBfXFdJhadDfD1q
	rJhSeNsvAujd2YbYxY2HRvfjpluBReOhdssQ==
X-Received: by 2002:a17:903:440f:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2beb0603fbemr81368385ad.28.1779539044856;
        Sat, 23 May 2026 05:24:04 -0700 (PDT)
Received: from [192.168.89.2] ([125.149.177.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm45002225ad.49.2026.05.23.05.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 05:24:03 -0700 (PDT)
Message-ID: <5315a2f6-3504-4660-8a64-51f7f6b69a45@gmail.com>
Date: Sat, 23 May 2026 21:24:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add packet-mode ESP offload for Airoha/EIP93
To: Christian Marangi <ansuelsmth@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260523121522.3023992-1-hurryman2212@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_052405_761795_E363D965 
X-CRM114-Status: GOOD (  20.82  )
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



On 5/23/26 21:15, Jihong Min wrote:
> This series adds the missing plumbing for ESP offload engines that
> operate on whole ESP packets instead of only exposing AES/HMAC through
> the crypto API AEAD interface.
> 
> The normal ESP software path can already call into accelerated AEAD
> algorithms, but packet-mode engines such as EIP93 can also generate and
> consume ESP packet framing: padding, pad length, next header and ICV.
> That needs a slightly different XFRM offload contract so the netdev
> driver can hand the skb to a packet backend rather than trying to make
> hardware fit the software trailer layout.
> 
> Patch 1 extends the ESP offload infrastructure for packet engines while
> preserving the existing behavior for drivers that do not opt in.
> Patch 2 exposes an EIP93 ESP packet backend for encapsulation and
> decapsulation.
> Patch 3 wires Airoha Ethernet GDM netdevs and DSA user ports to that
> backend through xfrmdev_ops. ESP GSO and ESP TX checksum offload remain
> disabled.
> 
> Runtime testing was done on a Gemtek W1700K2 running OpenWrt with the
> same changes applied on top of a 6.18.31-based kernel.
> 
> Test parameters:
> 
>   - Static IPv4 transport-mode XFRM SAs between the AP and host.
>   - ESP transform: auth hmac(sha1), enc cbc(aes) with a 128-bit AES key.
>   - iperf3 TCP test, AP as client and host as server:
>         iperf3 -c <host_ip> -P 4 -t 10
>   - The host always used normal Linux XFRM software processing.
>   - With AP ESP offload disabled, the AP also used the Linux XFRM
>     software path; in this setup, EIP93-backed AEAD crypto was still
>     available to that path.
> 
> Network-relevant test setup:
> 
>   - AP: Gemtek W1700K2, Airoha AN7581/EN7581, 4x Arm Cortex-A53 at
>     1.4 GHz, 2 GiB RAM, airoha_eth wan (GDM2) netdev, 10Gb/s full-duplex,
>     MTU 9200, EIP93 crypto and IPsec packet engine present.
>   - Host: AMD Ryzen 9 9950X3D, 16 cores/32 threads, Open vSwitch,
>     MTU 9978, backed by a ConnectX-6 Dx 10Gb/s full-duplex link.
> 
> AP to host iperf3 result:
> 
>   AP offload      Sender          Receiver        Retransmits
>   on              918.2 Mbit/s    913.6 Mbit/s    0
>   off             782.4 Mbit/s    778.6 Mbit/s    3569
> 
> This is a 17.3% receiver-side throughput improvement for the AP TX ESP
> path in this setup, with retransmits eliminated in the offloaded run.
> 
> Jihong Min (3):
>   xfrm: extend ESP offload infrastructure for packet engines
>   crypto: inside-secure: add EIP93 ESP packet backend
>   net: airoha: add EIP93-backed ESP XFRM offload
> 
>  MAINTAINERS                                   |    1 +
>  drivers/crypto/inside-secure/eip93/Kconfig    |   10 +
>  drivers/crypto/inside-secure/eip93/Makefile   |    1 +
>  .../crypto/inside-secure/eip93/eip93-ipsec.c  | 1413 ++++++++++++++++
>  .../crypto/inside-secure/eip93/eip93-main.c   |   69 +-
>  .../crypto/inside-secure/eip93/eip93-main.h   |   38 +-
>  drivers/net/ethernet/airoha/Kconfig           |   11 +
>  drivers/net/ethernet/airoha/Makefile          |    1 +
>  drivers/net/ethernet/airoha/airoha_eth.c      |   51 +-
>  drivers/net/ethernet/airoha/airoha_eth.h      |   69 +
>  drivers/net/ethernet/airoha/airoha_xfrm.c     | 1474 +++++++++++++++++
>  include/crypto/eip93-ipsec.h                  |  132 ++
>  include/linux/netdevice.h                     |    3 +
>  include/net/xfrm.h                            |    8 +-
>  net/ipv4/esp4.c                               |    6 +-
>  net/ipv4/esp4_offload.c                       |   29 +-
>  net/ipv6/esp6.c                               |    6 +-
>  net/ipv6/esp6_offload.c                       |   29 +-
>  18 files changed, 3324 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/crypto/inside-secure/eip93/eip93-ipsec.c
>  create mode 100644 drivers/net/ethernet/airoha/airoha_xfrm.c
>  create mode 100644 include/crypto/eip93-ipsec.h
> 

One note I should have included in the cover letter:

The hardware behavior used by this series was studied from the out-of-tree
IPsec branch of the mtk-eip93 driver:

  https://github.com/vschagen/mtk-eip93/tree/ipsec

That code was useful for understanding the EIP93 packet-mode ESP descriptor
programming and SA record values.

This series is not a direct import of that driver. The implementation was
rewritten around the current upstream driver layout and the Linux XFRM
netdev offload model, with EIP93 exposed as a packet-mode ESP backend used
by the Airoha netdev driver.


Sincerely,
Jihong Min

