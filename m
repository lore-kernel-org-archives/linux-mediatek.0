Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63435C4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 09:13:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE9A20857
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 09:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c9g3ciNf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="nICS6zfT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE9A20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NDcD/pzOumKVHG4QZjoFNd3CyXbkXLadPYgiokNJflk=; b=c9g3ciNfA6ANr43hojE9X9OSW
	QAyQmtai3273uHOg/nK6PC/JeuM2ciYBXg4GrSBreDL5CsahWVBkITNmiAoVTi2ghDORZ5osLz67S
	0x1/4KGLF7CxL0MN5vuM47sPx+WZ/HNvrDX4f0rVvUlCvhCibbX42s879whuGaWfbLtLs6lxOkgr7
	NswQitr5WO7SqmYEcGsvnVaYubv07LGZ6/4AMayeCoFnQd+ZE9JXnaow284z3TvjVF26U+OS2xzgR
	pDHs/TDmQGMSW6byFDe57t98qJNApa19qLr0ymy18ynHsNsz8+PnfTE29415zqMz8781kxlK8Kb4Q
	CIO6WlqkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdV9T-000888-RG; Fri, 13 Nov 2020 09:13:51 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdV9R-00086R-Kh
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 09:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5kzIrTeCquovS0+Gwl49sn6JqhqPJPdv4j4QLyEODfg=; b=nICS6zfTTUZo9FXocOudMUtWnL
 OztsrVFOaVAkyss4obwpWyrarikJudZWNCv8cv7O5NFVVpDCFAItU7hB1jxgqjXuL7CML93jDCPwV
 WXjUnd8ERgiuc25H1VYZt7XVX2/OdHcNYw3l9iC5FpgOIY248mtz7DSUCptNI05R5ur8=;
Received: from p5b206c33.dip0.t-ipconnect.de ([91.32.108.51] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kdV9M-00015Q-1D; Fri, 13 Nov 2020 10:13:44 +0100
Subject: Re: [PATCH 2/3] mt76: mt7915: remove unused mt7915_mcu_bss_sync_tlv()
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
References: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603988327.git.ryder.lee@mediatek.com>
 <4e10985307260de60fea3fae0b6f41985136082c.1603988327.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <ea7d90d0-cb7d-a8d3-a60d-c9863b6caa56@nbd.name>
Date: Fri, 13 Nov 2020 10:13:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <4e10985307260de60fea3fae0b6f41985136082c.1603988327.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_041349_968097_B6E7E1CA 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2020-10-29 18:11, Ryder Lee wrote:
> mt7915_mcu_bss_sync_tlv() is no longer used, so remove it.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 19 ++-----------------
>  .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 11 +----------
>  2 files changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index 18383dcdaf35..ed767b28aa86 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
This patch was missing a chunk to remove
sizeof(struct bss_info_sync_mode) from MT7915_BSS_UPDATE_MAX_SIZE.
I've fixed it up locally.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
