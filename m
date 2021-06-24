Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA43C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 06:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759B160724
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 06:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759B160724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6La/jP0CiKt0Wld2M2PfcqJgBKP0X+vvzrZzPb1Jkpg=; b=gcE04CwvVsG4hn
	VTnyAl391NuZwpBsoNIVGXKTJTRFOqth/YrWPXUy3jwJqHV2ZPa4jYSksQ3eP8eIyjN8ZHDhANtc8
	9gOGR+40dxaPKFQuScfr8ATNOjCiCqXAorVpp7H2aPdNWZlSMlBLTW3yoFh8YHN3DTd7o+GdNw1TJ
	+MPiRS1u0EaOMJw6LpViWPvA8mXK261/ouDTGRn71wZ/nUTpT6UEAXhJ5K6LGADwNEfJawLzB2qFy
	kBj/47X7tPoh0KMbMLwNp/R+yb97/gtsKfuc/DCi7+jedXAQthCWgQ3FYTakGIBWQ/+OQRVpY1dft
	VQ8THh3c1/YfKEYmC+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwIqK-00CwU9-RY; Thu, 24 Jun 2021 06:28:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwIqH-00CwSz-0G; Thu, 24 Jun 2021 06:28:02 +0000
X-UUID: bc36a3e0ed8c4a8e87860d82c89597b2-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+5KQJtVcIC70hhUVRKV5pDZ5YXUoWT9X/ZYYK7FCoyg=; 
 b=ewi2Hlc8OWZJy2w/UqySLMPEjKBakOEMWu3lnOkbWXxtUuIZStDifnAYkL94v+nbp0EVtVFyvP7Wx/dLYQcUi3NOFLKWp47FCASBXjzVWh9f99RtgWE3vugpQQObzvxh0INDhWRBBcCRrNPMB7PueYe57M88+vGGLUR4dBiNdjk=;
X-UUID: bc36a3e0ed8c4a8e87860d82c89597b2-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 168301091; Wed, 23 Jun 2021 23:27:58 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 23:27:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 14:27:55 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Jun 2021 14:27:53 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>, David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <bpf@vger.kernel.org>, <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Date: Thu, 24 Jun 2021 14:13:10 +0800
Message-ID: <20210624061310.12315-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNQYHfE09Dx5kWyg@kroah.com>
References: <YNQYHfE09Dx5kWyg@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_232801_100515_22556052 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-06-24 at 07:29 +0200, Greg KH wrote:
> 
> Thanks for the explaination, why is this hardware somehow "special" in
> this way that this has never been needed before?
> 
> thanks,
> 
> greg k-h
> 

Before kernel-4.18, RAWIP was the same as PUREIP, neither of them
automatically generates an IPv6 link-local address, and the way to
generate an IPv6 global address is the same.

After kernel-4.18 (include 4.18 version), the behavior of RAWIP had
changed due to the following patch:
@@  static int ipv6_generate_eui64(u8 *eui, struct net_device *dev)
+	case ARPHRD_RAWIP:
+		return addrconf_ifid_rawip(eui, dev);
 	}
 	return -1;
}

the reason why the kernel doesn't need to generate the link-local
address automatically is as follows:

In the 3GPP 29.061, here is some description as follows:
"in order to avoid any conflict between the link-local address of
MS and that of the GGSN, the Interface-Identifier used by the MS to
build its link-local address shall be assigned by the GGSN. The GGSN
ensures the uniqueness of this Interface-Identifier. Then MT shall
then enforce the use of this Interface-Identifier by the TE"

In other words, in the cellular network, GGSN determines whether to
reply to the Router Solicitation message of UE by identifying the
low 64bits of UE interface's ipv6 link-local address.

When using a new kernel and RAWIP, kernel will generate an EUI64
format ipv6 link-local address, and if the device uses this address
to send RS, GGSN will not reply RA message.

Therefore, in that background, we came up with PUREIP to make kernel
doesn't generate a ipv6 link-local address in any address generate
mode.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
