Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414CBC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 05:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLR15wq1vV5jIGkDAWPfk6qipEPROHspybwhFHtmm7I=; b=pZatpgsJfivfrbwA+YownFZNKe
	jzQkZf64NBIulN55GUDIGFhxMK2aQfo/Cq//JIZofesYA6AgrzNMohKAg+KMdoFFJuHOy1AHDOR/j
	tHOX8xHohjSKQm9A7StkYCTayJ5uaLFajIG7nQWmjppNJs265PvSldG6Gw+DhO3auGcy6v/HNhXyo
	XvK47qMjY+szh4LJoYxF4h68K4Q6vURS9HCIRd7de4UZoYpsiepNP6tQRonsxzJBA+Q14uzpL1HPY
	CsXn11qHms5QSGGOeer/W9h9Um43DrD+/lX/DU+fca6jwneCwrIBE+J6GYF+3QK11JBWfNkkAd6IQ
	K5WsvpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ45v-008S9a-Ty; Fri, 16 Sep 2022 05:40:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ45s-008S8V-SI
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 05:40:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94FCE627A6;
	Fri, 16 Sep 2022 05:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868FBC433D6;
	Fri, 16 Sep 2022 05:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663306851;
	bh=0Ry4wH5Rz2WvxH+iMDnYDOverOqyXZxPcfiZSKnbpFw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=I0LerziGGTBlBA+grbLxwWaw/+uToo+hb7gYV5vrH53HX7L8ZqIea/e5iXFK0EofE
	 733k1aQ5BUULc5vhp8A2sqE8t6XLxfiflIiLSheXtIikJimlAh+wD2C5QXnegLFKde
	 /ul6kzR9ee458xTn/J0aG6bb5rzmCTDiWT8RBo9ave9oMcAZHR0wG9TEeUcHfp5XFG
	 4RzoryrXu06YKY0ESVHTTCd9eDxmTwv5hEw4nW0rUUuH2vOXwGrQLEJxy/bmOmkedv
	 BDmo3PkiW6ovgcVhOY9doghazpEAhljTHU3KzDmN4/o1bN7K4dNVBD1I6BnEL6Yf4m
	 nhE6qz39Z/NBw==
From: Kalle Valo <kvalo@kernel.org>
To: <sean.wang@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo.bianconi@redhat.com>,  <Soul.Huang@mediatek.com>,  <YN.Chen@mediatek.com>,  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,  <Deren.Wu@mediatek.com>,  <km.lin@mediatek.com>,  <jenhao.yang@mediatek.com>,  <robin.chiu@mediatek.com>,  <Eddie.Chen@mediatek.com>,  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,  <ted.huang@mediatek.com>,  <Stella.Chang@mediatek.com>,  <Tom.Chou@mediatek.com>,  <steve.lee@mediatek.com>,  <jsiuda@google.com>,  <frankgor@google.com>,  <kuabhs@google.com>,  <druth@google.com>,  <abhishekpandit@google.com>,  <shawnku@google.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] mt76: mt7921: fix antenna signal are way off in monitor mode
References: <e987d8149d6e00b2bec979a343681ddedea3c347.1663288354.git.objelf@gmail.com>
Date: Fri, 16 Sep 2022 08:40:40 +0300
In-Reply-To: <e987d8149d6e00b2bec979a343681ddedea3c347.1663288354.git.objelf@gmail.com>
	(sean wang's message of "Fri, 16 Sep 2022 08:39:19 +0800")
Message-ID: <87tu57anc7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_224052_970546_429EC6E7 
X-CRM114-Status: GOOD (  11.31  )
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

<sean.wang@mediatek.com> writes:

> From: Sean Wang <sean.wang@mediatek.com>
>
> Group 3 in RxD is disabled in monitor mode. We should use the group 5 in
> RxD instead to fix antenna signal way off issue, e.g we would see the
> incorrect antenna signal value in wireshark. On the other hand, Group 5
> wouldn't be used in STA or AP mode, so the patch shouldn't cause any
> harm to those modes.
>
> Fixes: cbaa0a404f8d ("mt76: mt7921: fix up the monitor mode")
> Reported-by: Adrian Granados <agranados@gmail.com>
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

The title is missing "wifi:".

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

