Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA20C001DE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzcwBdf78cB/48//MiDdlDYiBVzXqww9lihlrmokRJw=; b=HLDvkDbuv9/9/AAHRo11atWngV
	xRfZcRbMN7DafiRmyWxvbcC5LY4j31FXsl3OVd8BQOOJfMYQVsg4IiZGm3sYJZmBk42aZS7C/xkuD
	JIuSMIhbYfSQh3vWsel30oYh+8bxj/FtX7VAv8n/k17hUmMjtsdAfxnx0u+Yhf8ZOMxPnmLJ3NPF2
	uk52W+tRZzP7jpsiOAN2mJled0KnMEGN1Cbs+LGL14Z1+t+KqGDxS3q0Kwdk0beqsC+e1FqePwfqh
	gqvisMVbvrqEcQ6Z+W7VnjTBl2yk41vWfyI0fEWbDFPOVO6ZkmnqiXgvErqGFUQq/UMFlg5w3G7mz
	530Jwtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN61H-00FwH8-2P;
	Sat, 22 Jul 2023 06:23:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN61F-00FwGK-09;
	Sat, 22 Jul 2023 06:23:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5368160A2B;
	Sat, 22 Jul 2023 06:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23582C433C8;
	Sat, 22 Jul 2023 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690006987;
	bh=ATt0mJH63hD11NsGO1CXJNXu6h7gACVARO144Twht50=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lrpv8S0y1i61UKW0kJN2SmXvdtQ/2eVs6CPM3ouaiY6RVD+ZLeJxE7aP/2isQU2GF
	 YFGYStBGddsuVfDatpCqMKzbx0QNXobSYPnlKMs3Bg0FbOdh11jVqsIPsxioIoZuSa
	 /BgqmsVhNXiPa+8l8kp8ZT1Ly0zvuy1OKFun3kLtTYwfVXlSr3jbghQKfpR704HR8V
	 WnWQWjZs/0uTSBPcM7ABIoPTX9KDnJDcAVfXE3dnnw8IYLecATEUgsG4rEw2EcJqyt
	 4BIXlDOb3YMbp1CDz9t6AvjVpangT9xN/jPvz1EqkRxyf4Ef3Wbud7I3agYId9YiSe
	 rLvvNZqdHkbMQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,  Paul Fertser <fercerpav@gmail.com>,
  linux-wireless@vger.kernel.org,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Paolo Abeni <pabeni@redhat.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  Rani Hod <rani.hod@gmail.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH] mt76: mt7615: do not advertise 5 GHz on first phy of
 MT7615D (DBDC)
References: <20230605073408.8699-1-fercerpav@gmail.com>
	<00a2f5ba-7f46-641c-2c0e-e8ecb1356df8@nbd.name>
	<20230721073701.38f8479c@kernel.org>
Date: Sat, 22 Jul 2023 09:23:03 +0300
In-Reply-To: <20230721073701.38f8479c@kernel.org> (Jakub Kicinski's message of
	"Fri, 21 Jul 2023 07:37:01 -0700")
Message-ID: <87jzus1n3s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_232309_128798_9ABCBC2E 
X-CRM114-Status: GOOD (  12.65  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> On Fri, 21 Jul 2023 10:03:49 +0200 Felix Fietkau wrote:
>> On 05.06.23 09:34, Paul Fertser wrote:
>> > On DBDC devices the first (internal) phy is only capable of using
>> > 2.4 GHz band, and the 5 GHz band is exposed via a separate phy object,
>> > so avoid the false advertising.
>> > 
>> > Reported-by: Rani Hod <rani.hod@gmail.com>
>> > Closes: https://github.com/openwrt/openwrt/pull/12361
>> > Fixes: 7660a1bd0c22 ("mt76: mt7615: register ext_phy if DBDC is detected")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Paul Fertser <fercerpav@gmail.com>  
>> Acked-by: Felix Fietkau <nbd@nbd.name>
>> 
>> Jakub, could you please pick this one up for 6.5?
>
> Kalle reported that he's back to wireless duties a few hours after you
> posted so just to avoid any confusion - I'll leave this one to Kalle
> unless told otherwise.

Yup, I'm back. I assigned this to me on patchwork and planning to queue
for v6.5.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

