Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C996DC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBARwm2UVWshHFhYk6phvrYSaerDzXrx78/aoytpsi4=; b=mg134QaoznWqKGP2BQgxA5ojev
	EMz0WMV8Rx3HGGDjZbL1gvaDVL9dhgSiRVcmfCHgBX0urAfojMKtWTQA/kXBRuj/swBtuZnqvFvzN
	AKP7s6R7sc6Nad4t+rQGancC0optWbsM+VvL6qG1HVoJ3TAvkBwL8A5VwpBkFFpyLyxNtBZ/vg+78
	LU3q2LOqXbZZ+JYU0DRS5tnpkh6rdYfN0XNyoRIlxTxKM6459fO+JYr+8OOrad9CkwUjffsWGdj5y
	Q+xJ2JZpv6P7/O01A+taqvxbchj3XCrBWW2C4Rx1ZA/39rYX7ffn3mM3cUtpX3MwhF14jt6ZcZxze
	My8AYkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIS6-00DZDg-1o;
	Thu, 07 Dec 2023 17:46:22 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIS3-00DZDA-1C
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 17:46:21 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id CF906340070;
	Thu,  7 Dec 2023 17:46:13 +0000 (UTC)
Received: from [192.168.100.159] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id B012D13C2B0;
	Thu,  7 Dec 2023 09:46:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B012D13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1701971171;
	bh=/KY1Y1hllUosW6B9lNhb7NwYiH0r/valIDYaF8TvxHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jWoni6TcRDhEdJoaoJAWUVI0b0lFZdjvFhwX3S6x2gw9lgadwk4YVrhQnDG88dJB+
	 GLY1NHtQqJu7IMZWrI0XkfIRR9yw+sTei1NF2g/ncdry+98RjmOnmI0kQMMV3+pevf
	 lJCqNDeTQOX4ZG1LFZQIkwNcIedHN5YB7QALUruQ=
Message-ID: <ccc118d5-297b-e999-10c7-edff4e24fef4@candelatech.com>
Date: Thu, 7 Dec 2023 09:46:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] wifi: mt76: mt7996: switch to mcu command for TX GI
 report
Content-Language: en-US
To: shayne.chen@mediatek.com, "nbd@nbd.name" <nbd@nbd.name>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 =?UTF-8?B?QmVuamFtaW4tancgTGluICjmnpfmtKXnt68p?=
 <Benjamin-jw.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
 <20231102100302.22160-4-shayne.chen@mediatek.com>
 <ae3f3bdb-0de3-e15c-f447-6d1d33478051@candelatech.com>
 <38bc4fd457247edeea18e4eacfed89d74264be58.camel@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <38bc4fd457247edeea18e4eacfed89d74264be58.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1701971176-HxCbBbJyakbL
X-MDID-O: us5;at1;1701971176;HxCbBbJyakbL;<greearb@candelatech.com>;dbba72c6a891d3e8767bcea3b0305f22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_094619_505576_AB4BC876 
X-CRM114-Status: GOOD (  21.95  )
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

On 12/7/23 09:07, shayne.chen@mediatek.com wrote:
> On Mon, 2023-12-04 at 13:57 -0800, Ben Greear wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On 11/2/23 03:02, Shayne Chen wrote:
>>> From: Benjamin Lin <benjamin-jw.lin@mediatek.com>
>>>
>>> During runtime, the GI value in the WTBL is not updated in real-
>> time. To
>>> obtain the latest results for the TX GI, switch to use an MCU
>> command.
>>
>> Hello,
> 
> Hi Ben,
>>
>> I do not see this callback happening on my system.  What firmware
>> version
>> is needed for this to work?
>>
>> And where to find it...
>>
> 
> Please get testing firmware files from the following link to see if it
> works on your environment:
> https://github.com/csyuanc/linux-firmware

I do see the callback happening with that latest firmware, thanks for the link to that.

tx_gi is always reported at zero though, which seems unlikely to be correct.

[  625.875443] mt7996e 0000:0d:00.0: ERROR: MCU:  Sequence mismatch in response, seq: 13  rxd->seq: 12 cmd: 130022
[  625.988751] update-tx-gi, mode: 8  tx_gi: 0
[  625.988755] update-tx-gi, mode: 0  tx_gi: 0
[  626.091378] mt7996e 0000:0d:00.0: ERROR: MCU:  Sequence mismatch in response, seq: 1  rxd->seq: 15 cmd: 130022
[  626.204917] update-tx-gi, mode: 8  tx_gi: 0
[  626.204920] update-tx-gi, mode: 0  tx_gi: 0
[  626.307376] mt7996e 0000:0d:00.0: ERROR: MCU:  Sequence mismatch in response, seq: 4  rxd->seq: 3 cmd: 130022
[  626.421332] update-tx-gi, mode: 8  tx_gi: 0
[  626.421335] update-tx-gi, mode: 0  tx_gi: 0
[  626.523436] mt7996e 0000:0d:00.0: ERROR: MCU:  Sequence mismatch in response, seq: 7  rxd->seq: 6 cmd: 130022
[  626.636900] update-tx-gi, mode: 8  tx_gi: 0
[  626.636904] update-tx-gi, mode: 0  tx_gi: 0
[  626.739408] mt7996e 0000:0d:00.0: ERROR: MCU:  Sequence mismatch in response, seq: 10  rxd->seq: 9 cmd: 130022
[  626.852727] update-tx-gi, mode: 8  tx_gi: 0
[  626.852731] update-tx-gi, mode: 0  tx_gi: 0
[  626.955475] mt7996e 0000:0d:00.0: ERROR: MCU:  Sequence mismatch in response, seq: 13  rxd->seq: 12 cmd: 130022


diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 407894c13d91..8aad38a21cd4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -534,6 +534,9 @@ mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
  static int
  mt7996_mcu_update_tx_gi(struct rate_info *rate, struct all_sta_trx_rate *mcu_rate)
  {
+       pr_info("update-tx-gi, mode: %d  tx_gi: %d\n",
+               mcu_rate->tx_mode, mcu_rate->tx_gi);
+
         switch (mcu_rate->tx_mode) {
         case MT_PHY_TYPE_CCK:
         case MT_PHY_TYPE_OFDM:
[greearb@ben-dt5 mediatek]$


And lots of seq mismatch warnings in this firmware...could that be because of the new guard-interval
callback perhaps?  Do the messages sent from FW increment the seq number?  The parse-response code appears
to assume that it's responses are the only thing that would increment the seq number...

Here's my code to debug the seq mismatch:

static int
mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
			  struct sk_buff *skb, int seq)
{
	struct mt7996_mcu_rxd *rxd;
	struct mt7996_mcu_uni_event *event;
	int mcu_cmd = FIELD_GET(__MCU_CMD_FIELD_ID, cmd);
	int ret = 0;

	if (!skb) {
		const char* first = "Secondary";

		mdev->mcu_timeouts++;
		if (!mdev->first_failed_mcu_cmd)
			first = "Initial";

		dev_err(mdev->dev, "MCU: %s Failure: Message %08x (cid %lx ext_cid: %lx seq %d) timeout (%d/%d).  Last successful cmd: 0x%x\n",
			first,
			cmd, FIELD_GET(__MCU_CMD_FIELD_ID, cmd),
			FIELD_GET(__MCU_CMD_FIELD_EXT_ID, cmd), seq,
			mdev->mcu_timeouts, MAX_MCU_TIMEOUTS,
			mdev->last_successful_mcu_cmd);

		if (!mdev->first_failed_mcu_cmd)
			mdev->first_failed_mcu_cmd = cmd;
		return -ETIMEDOUT;
	}

	mdev->mcu_timeouts = 0;
	mdev->last_successful_mcu_cmd = cmd;

	if (mdev->first_failed_mcu_cmd) {
		dev_err(mdev->dev, "MCU: First success after failure: Message %08x (cid %lx ext_cid: %lx seq %d)\n",
			cmd, FIELD_GET(__MCU_CMD_FIELD_ID, cmd),
			FIELD_GET(__MCU_CMD_FIELD_EXT_ID, cmd), seq);
		mdev->first_failed_mcu_cmd = 0;
	} else {
		/* verbose debugging
		   dev_err(mdev->dev, "MCU: OK response to message %08x (cid %lx ext_cid: %lx seq %d)\n",
		           cmd, FIELD_GET(__MCU_CMD_FIELD_ID, cmd),
		           FIELD_GET(__MCU_CMD_FIELD_EXT_ID, cmd), seq);
		*/
	}

	rxd = (struct mt7996_mcu_rxd *)skb->data;
	if (seq != rxd->seq) {
		dev_err(mdev->dev, "ERROR: MCU:  Sequence mismatch in response, seq: %d  rxd->seq: %d cmd: %0x\n",
			seq, rxd->seq, cmd);
		return -EAGAIN;
	}

	if (cmd == MCU_CMD(PATCH_SEM_CONTROL)) {
		skb_pull(skb, sizeof(*rxd) - 4);
		ret = *skb->data;
	} else if ((rxd->option & MCU_UNI_CMD_EVENT) &&
		    rxd->eid == MCU_UNI_EVENT_RESULT) {
		skb_pull(skb, sizeof(*rxd));
		event = (struct mt7996_mcu_uni_event *)skb->data;
		ret = le32_to_cpu(event->status);
		/* skip invalid event */
		if (mcu_cmd != event->cid)
			ret = -EAGAIN;
	} else {
		skb_pull(skb, sizeof(struct mt7996_mcu_rxd));
	}

	return ret;
}

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



