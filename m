Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5D0C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:54:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5360C23105
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5360C23105
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X+Hp6Bq+HgNtb+8WLIG4JvdyukSkMUj1XsN9peXJiLA=; b=PBZdtyaoD7DFT8PAuf5Zc0eDR
	sTBt8MfcTi/oVGBFEQ1x5H2qPjURjwFAS6HrruRVl1YdRSRiBeZiSyooKzlkSxOn9EMdtZjzd+ntN
	525wTD/BTkMlAgDfEn55+R3sSaxkSpkVCiQtSD+sGxkgc0zb08PR+AxhPw7oMys6euSHaw2UEUaX7
	L8nMR9r4oocRsWft2wam/NvCavnhc6G2oWSTFOQUFK4MVFooPcErq3eSBfv6WfvcREmAagNqc5miL
	uvggqlzscTjTniAOmWRx83xzkyyftQbXlzN6C6/allHcUFk2oJ9VLlu12hlsHMvZ5OiXWHo3Kx5oe
	g3Uk9DqFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6S3-0005RL-Eo; Wed, 06 Jan 2021 10:54:03 +0000
Received: from mail.toke.dk ([45.145.95.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6Rz-00051A-SK
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:54:02 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1609930270; bh=Z4mZUkE7Z9ZY+z1IvqXWeSPR1h3ZXhuXokAhd6RtGp0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gprq7LBe2GwEcqSN10ixDnglRGCoAMxMeoi/RqsCrHEx8pG+vg+SjQhQEFXd9nM9E
 /MpA1zz9uFDnUpBwftmX5VDZuBjNl7G4rsuO5kZhQ/quV3/hSICKh6AqItYeF1qTGt
 OHjVoGkvNWBK2HAuMwBG3+CIl/gzrvTP4EC8D5NYgYet0Q1XpjxLWJXvQMCFF2vDV6
 M+zqcSRKv3lrXCe7g07BiKWtH1mTCthe6wG5dFKfbqQTbeW8jtLHoDAoFIEDzp+Hwd
 n30A/sjfJINCOvOAaOO/HPSz546/iyT5L14lFnTGAeHdqEazKsZG9HI/yK6nUIMSzD
 wO0P0IGG4htZg==
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
In-Reply-To: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
References: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
Date: Wed, 06 Jan 2021 11:51:07 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87r1my49us.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_055400_925831_7A861E64 
X-CRM114-Status: UNSURE (   5.91  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> The selected txq should be scheduled unconditionally if
> NL80211_EXT_FEATURE_AIRTIME_FAIRNESS is not set by driver.
>
> Also put the sta to the end of the active_txqs list if
> deficit is negative then move on to the next txq.

Why is this needed? If the feature is not set, no airtime should ever be
accounted to the station, and so sta->airtime[txqi->txq.ac].deficit will
always be 0 - so you're just adding another check that doesn't actually
change the behaviour, aren't you?

-Toke

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
