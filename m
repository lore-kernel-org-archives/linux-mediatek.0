Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28249C54ED1
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 May 2025 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TfqTMDO3ZkrtvqxCow51anYPKCVOqMiIoPaqrzlq6KM=; b=3S1m11D6Vb0T8ukID2bnO6WxjC
	ZtnD45iR4oD+jE4yRPzfRlqOsWHyRw1Rwk29N0lVvU4Rk2uXOYDyWpK0tisVlImZ2KaneGuWbauZJ
	0AEPA48xUFnzBX3u4OTF4qDdhcK3RvHKp0U4zRzbdAXpebosDMvp9q+KuyZHkmJykBKTQgHt04GC6
	oEeCHtmvba8Z/4WB/M5pGHEBFnQ7V/Ez2+l8oOlbntnZcNADlKOmy9gLyfGh80933DbqUTrKa4l7W
	fNfrUrGAz+5KQ9gNXVDgusDmapn9DOiVMt6oOntZefBDhPjODjHJpsmVYAV0t4lDmuVy7pdtNKHGa
	MZhOmzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1It-0000000BXrN-46rB;
	Tue, 27 May 2025 20:53:43 +0000
Received: from mail1.systemli.org ([2a11:7980:3::36] helo=mail.systemli.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Id-0000000BXql-3j9e
	for linux-mediatek@lists.infradead.org;
	Tue, 27 May 2025 20:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
	s=default; t=1748379205;
	bh=TfqTMDO3ZkrtvqxCow51anYPKCVOqMiIoPaqrzlq6KM=;
	h=Date:From:To:Subject:From;
	b=pTqsWsMHazO1YASYhBwYy7OtM807LLnENb7nL2le0iXaE4OGrDj+Wci8EN2tMsTQY
	 x3VbJ2ghkpgP+SiCwJe/ykMt8gO4vN7gRgDdMe7kFor/gfplfu3PNRNOC/usYbCA0x
	 huF4+UYMJe+9rScfSVUQE+V76HwCGTM925g5nIRUSlrBdMIHNIMY3A2K1tw36xG0C/
	 tv0d6TmyxTk93j/AyMT5VI9gfrn0lIHOmRLTscomxDc5QslcidoO/rNrXWPLUIn19A
	 sP086ZfUZMg+5p+3tjxLsMkTJwjXErVrdQbHlzPWPDwk96TPNz/CRbmgUG0HWHTYXQ
	 fiItZnTj4hqfQ==
Message-ID: <b5e2c58a-9f1b-4295-83e2-53b38f0ef005@systemli.org>
Date: Tue, 27 May 2025 22:53:24 +0200
MIME-Version: 1.0
Content-Language: en-US
From: nick <vincent@systemli.org>
To: linux-mediatek@lists.infradead.org
Subject: [BUG] Stale FDB entries after WLAN roaming with mt7530 DSA on
 untagged ports
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_135328_080880_9E622A93 
X-CRM114-Status: UNSURE (   8.56  )
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

Hi,
OpenWrt users are observing an issue on OpenWrt (22.03+) with the mt7530 DSA
switch, where roaming wireless clients leave behind stale FDB entries when
using *untagged* VLAN ports. The client's MAC address remains associated
with both the old and new AP interfaces, causing traffic to be misrouted
or dropped until the stale entry expires.

People describe the steps to reproduce it differently; however, I share what
I observe, and the result is the same.

Steps to reproduce:
1. Bridge WLAN to a VLAN via mt7530 DSA, using *untagged* ports.
2. Connect a wireless client to AP1 (mt7530 switch).
3. Roam the client to AP2 (no mt7530 switch).
4. Roam back to AP1 (now connectivity breaks).
5. Observe that AP1 (where the client is now connected) FDB still lists the
    client MAC on the ethernet, e.g. dev lan4 vlan 40 self (pointing to AP2)
    and the wlan interface, but does not route traffic to the wlan (dev
    wlan5-ff used 127/0 master br-dhcp). So two entries are available.

Topology diagram illustrating the setup:

                 +--------+       +------+
                 | Router |       | AP2  |
                 | (DHCP) |       +------+
                 +--------+           |
                      \               |
                       \             /
                        \           /
                      +---------------+
                      |     AP1       |
                      |   mt7530 DSA  |
                      +---------------+

Expected behavior:
The FDB should update immediately to reflect the new interface.

Actual behavior:
The stale entry persists, breaking connectivity until it times out.

Notes:
- This connectivity breakdown does *not* occur using tagged ports; only
   untagged ports are affected.
- It did not occur with `swconfig` (pre-DSA switch framework).
- For some users, a user-space FDB cleanup script worked (however, it does
   not work for me).
- The issue is still present with kernel version 6.12 (latest tested).

More discussion and technical details can be found here:
https://github.com/openwrt/openwrt/issues/11650

Any help or insights would be greatly appreciated. This issue has been
present for quite a long time, and that’s why I’m reaching out for help
via this mailing list.

Best regards,
Nick

