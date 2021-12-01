Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3935C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sogc5sj8l3Zd5ep95nZFDtlL9eIJqG529Q2WKHSKUGY=; b=mJOVSv7xN6lN9Yh7EyTdSRmEpM
	abRxxKCYFECh8SHHu73tEP59bbQ6IyN29GOuBQ/6arPyiRkNhQLQVgthnE1CXdlp+m6york8diqAe
	2fvHU8yCPpZdj8Y2s59NQI/naMbMbzEqcGEyLmC/eDhfVyAf0np3awO80Jm1QK91gw6RNTL/JL3Lc
	mO5Uq7hAkFCP2rYMj/+D4aoa/P9P+byPI9WBNGgdQC730vsK+yPxU/43hsg2COIKpC73njCIeSsUI
	Ttq3gMsuljrDqT1VGsz/W0UjHwei2bLYdlYKrm+C9Vc4sW2Z/TpG5iIqqf9qcGhw/uXSBUvegIdph
	Wv4sBfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMFr-007yrR-Jn; Wed, 01 Dec 2021 09:50:23 +0000
Received: from simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMFo-007yq1-BX
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 09:50:22 +0000
Received: from [IPv6:2003:c5:973f:dc98:2d8:61ff:feb7:ca5c]
 (p200300c5973fdC9802d861FFfeb7CA5c.dip0.t-ipconnect.de
 [IPv6:2003:c5:973f:dc98:2d8:61ff:feb7:ca5c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by simonwunderlich.de (Postfix) with ESMTPSA id A79D2FA1B7;
 Wed,  1 Dec 2021 10:41:28 +0100 (CET)
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, linux-mediatek <linux-mediatek@lists.infradead.org>
From: Jan Fuchs <jf@simonwunderlich.de>
Subject: mt76: MT7921K monitor mode not working
Message-ID: <7e156597-a206-b236-e4c8-d476614de7ef@simonwunderlich.de>
Date: Wed, 1 Dec 2021 10:41:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_015020_631687_73E4FF61 
X-CRM114-Status: UNSURE (   7.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

we are not able to obtain any packets when packet capturing with the 
Mediatek MT7921K in monitor mode on 2.4, 5 and 6 GHz.
tcpdump will show you 0 recorded packets. When doing a "iw dev wls1 
scan" on a parallel running managed interface on the same phy, the 
packet capture will contain beacons and probe responses from the scan 
though.
Can anyone confirm that?

mt76 (https://github.com/openwrt/mt76/commits/master): commit 
6fad970893dd26ef6e6c8344b958344254f6362a (HEAD -> master, origin/master, 
origin/HEAD)
Kernel: 5.16.0-rc2-next-20211124+
WM Firmware Version: ____010000, Build Time: 20211014150922

Steps to reproduce:
sudo iw dev wls1 del
sudo iw phy phy0 interface add mon0 type monitor
sudo ip link set dev mon0 up
sudo iw dev mon0 set freq 6115
sudo tcpdump -i mon0 -w 6g-capture.pcap

Kinds regards, Jan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
