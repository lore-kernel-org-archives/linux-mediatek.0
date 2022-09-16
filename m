Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A1ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 05:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxKvSLvQYSH+KYSr+i/dVt/jFIpr6dhHCAF64Jm4eS0=; b=z34JeOG4k/oSGC9B9GAuFufuDZ
	EnWoOrhGT6kiLOPAG4poWSwOUyaa3yX1YvuWt/h56/v6ggV3wg4aFkiJRLR5PpYJuWPJxQl3v8ygQ
	qID8FAra138i0Gwu3sfURbSHnur7Yq3mW1YtTMtkH9lEj/bToVCsrxmBJugSvK8WaET38lR+MXB2r
	pfsDCYyOgfc2wx12TwJ8eW2rObX7wkA7tIqtCnsP4KBVJtrbZOSNIhQndB8eJfk8QVNeKzGZAME6a
	d5vLeyYfhK8PeNOjctLoUv6rZ+LWZk3ojihN8urf5DDBDCytaprnAYG2tG4+9cE91OHf36bV90S8J
	bBRXJONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ42U-008OpC-02; Fri, 16 Sep 2022 05:37:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ42R-008OaL-87
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 05:37:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99408B82319;
	Fri, 16 Sep 2022 05:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB342C433C1;
	Fri, 16 Sep 2022 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663306635;
	bh=jM5saF8A2jQF85Jq+EzNXODocbAeHuLf4n0rQwVxZlo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Smf2uhH/NHhercMlEbVhAZ7OFahC35FBj7VSPD8BLfXVIsx4AeKb+pLgxupUxJT5Y
	 +DdisgxqyoafWZkhCj1xh0t3MsNbzhN2BHRDfDe3PvNz+X34AHkwulQbLhMOsIvzGJ
	 fN5nYnNGBKT3ZAHzOrZvBtvO18UQLvcd76MMdymAwSWdAxjzg1ypXGTESt91J1zJ6A
	 edLw/4T+P4oRE0cHrNSG2sUmW3GM7FM0DRtvwmjA1D6vRM9/9o013hFklas3WlR756
	 SaqHfdrb1C4j/5svet+YZ54nHXPhht417Ex9TpkIpLdK6piNpntTx2lsAMZ4lXFUBS
	 EIiOBulJb8vfA==
From: Kalle Valo <kvalo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: sean.wang@mediatek.com,  lorenzo.bianconi@redhat.com,  Soul.Huang@mediatek.com,  YN.Chen@mediatek.com,  Leon.Yen@mediatek.com,  Eric-SY.Chang@mediatek.com,  Deren.Wu@mediatek.com,  km.lin@mediatek.com,  jenhao.yang@mediatek.com,  robin.chiu@mediatek.com,  Eddie.Chen@mediatek.com,  ch.yeh@mediatek.com,  posh.sun@mediatek.com,  ted.huang@mediatek.com,  Stella.Chang@mediatek.com,  Tom.Chou@mediatek.com,  steve.lee@mediatek.com,  jsiuda@google.com,  frankgor@google.com,  kuabhs@google.com,  druth@google.com,  abhishekpandit@google.com,  shawnku@google.com,  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] mt76: mt7921: fix antenna signal are way off in monitor mode
References: <0f95fcdb8511ec765040c8fe85c1fa09437e8ef5.1659574985.git.objelf@gmail.com>
	<982053de-7bc0-0d4e-9eb7-9da0be559058@nbd.name>
Date: Fri, 16 Sep 2022 08:37:07 +0300
In-Reply-To: <982053de-7bc0-0d4e-9eb7-9da0be559058@nbd.name> (Felix Fietkau's
	message of "Thu, 15 Sep 2022 12:37:27 +0200")
Message-ID: <8735crc22k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_223719_476788_A1999E4C 
X-CRM114-Status: GOOD (  12.19  )
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

Felix Fietkau <nbd@nbd.name> writes:

> On 04.08.22 03:07, sean.wang@mediatek.com wrote:
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Group 3 in RxD is disabled in monitor mode. We should use the group 5 in
>> RxD instead to fix antenna signal way off issue, e.g we would see the
>> incorrect antenna signal value in wireshark. On the other hand, Group 5
>> wouldn't be used in STA or AP mode, so the patch shouldn't cause any
>> harm to those modes.
>>
>> Fixes: cbaa0a404f8d ("mt76: mt7921: fix up the monitor mode")
>> Reported-by: Adrian Granados <agranados@gmail.com>
>> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>
> This patch has been line wrapped and does not apply. Please resend.

And please use "wifi:" in the title.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

