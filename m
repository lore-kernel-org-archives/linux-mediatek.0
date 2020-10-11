Return-Path: <SRS0=RXhr=DS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FEAC433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2020 19:37:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A2B2083B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2020 19:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjpfmoKW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="aAwU3JaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A2B2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2f2gh8lSPgXDmiZA2tAxYAyAN1aKNDxB/oHa3VPGd64=; b=mjpfmoKWE44rtKh1yplXnQgBK
	21xHwyfRkwqITlvHpMA3uWMZ9YqD6xGW/atzb8lSN1ZNPwUaKFkWJ4epVilbM8cKYsSr5FKzUhyji
	oujb4oe3bi7kixqoHUQxyvNW/P6O/J3FE8WNV7TP9OHVcxZiRpVuyKiZIlWnIxnsgGzFQSH3LiFLo
	NHDYUmhOLbEd52cgFdcknf7aQqhjIHMAlWQQ15LsJ1Zu/GY3Q3PyPUojTZq9sZI/EgKrBSccNCnzK
	2EA0IZzD/gp9U6/NSdEMhWlTIGPPpdHwpvp6IcDsoSL3KFoj6Ff+JQQkmxkD17kVaDNXG2WsVbsZe
	gTkc7XBZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRh9x-0000Se-QG; Sun, 11 Oct 2020 19:37:33 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRh9v-0000SG-Ef
 for linux-mediatek@lists.infradead.org; Sun, 11 Oct 2020 19:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t+TL1U9ATFrnvcxEvpx5NcXpCLcm2ex+63jpmjVkYVI=; b=aAwU3JaBO5NNlLIF0TEdYTcO87
 w6lsiun4yGESpIAthlkB17vf0PvNOyRT1BBNOTzXdMG3pK/Pfoa46o0weitkYaYVkq0Y7G0I/ywS4
 ERS51g0B3Ts7Nyc0hSjFTwtkV1H63uK1TGfGcExu7DWdlZUyrWfctWrnSimq4gyMPTCM=;
Received: from p54ae9462.dip0.t-ipconnect.de ([84.174.148.98] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kRh9p-0006lH-HN; Sun, 11 Oct 2020 21:37:25 +0200
Subject: Re: [PATCH 02/10] mt76: testmode: add snr attribute in rx statistics
To: Shayne Chen <shayne.chen@mediatek.com>
References: <20201008112904.10620-1-shayne.chen@mediatek.com>
 <20201008112904.10620-2-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <e0e661ed-f351-043d-d151-bf30dd766925@nbd.name>
Date: Sun, 11 Oct 2020 21:37:25 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201008112904.10620-2-shayne.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_153731_604310_B4CBB560 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-10-08 13:28, Shayne Chen wrote:
> Support to display snr value when dumping rx statistics.
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
> index 02c9495..4015f1d 100644
> --- a/drivers/net/wireless/mediatek/mt76/testmode.h
> +++ b/drivers/net/wireless/mediatek/mt76/testmode.h
> @@ -101,6 +101,7 @@ enum mt76_testmode_stats_attr {
>   * @MT76_TM_RX_ATTR_RCPI: received channel power indicator (array, u8)
>   * @MT76_TM_RX_ATTR_IB_RSSI: internal inband RSSI (array, s8)
>   * @MT76_TM_RX_ATTR_WB_RSSI: internal wideband RSSI (array, s8)
> + * @MT76_TM_RX_ATTR_SNR: signal-to-noise ratio (s32)
I think u8 makes more sense than s32 as a type for snr.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
