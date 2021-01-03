Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B452C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 12:00:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDDB207D0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 12:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECDDB207D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xwEjpmNsfkXT7z6QX5Tk67ps4wjSuSJiwv3XVchtzYg=; b=qHXCNZftPvmGEyP1D9VM5kpBO
	EKxB2o73M0E+dhAF6Tqu6jD2QDMYX58a/9Lpqhm/SIL8RzhHZqmvc0FBi5SmlIHhqmcqLnlLB8UGr
	MqIvV6F5EVVYM6hTxgONSgCMFf2tL6gtJ1Vs1euD0cpRco/06aBwSmOPWSst3UrBxb/UJWn0zDZHb
	DuZwgnwy0EGIEXXEq3twdD/mWgGmSj1IJMXe3mjwVQuo+2V87GjVHhbtPheR+sWQPN0QYLb5HTzz3
	q+P5hWiyzrBvxVFUfX3EFvUeJ8pa6AJUAEdEuT/neMEnt/7auK9czE+FTx5JNxCeNbchqXk218XEC
	pU2xLHvGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw23k-0003sO-Nc; Sun, 03 Jan 2021 12:00:32 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw23i-0003rj-UL
 for linux-mediatek@lists.infradead.org; Sun, 03 Jan 2021 12:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3F4MjoXVKz97IMWrdfiTFch6WUbtC66BpQnXjqENIbg=; b=InSDWN1c9uBdMk7kpOr3p9kpSP
 wFRmHsLoRj+3riB/12XHEQkMNAuHA01wgpgC9eOGDQo2qG8I5kFv4WwT5fq1mMCaPFbv1V7zqMDs1
 C1w/N/BeB3l20uIMMdmCxMtmT8594W8AtCudfJ7FUTFf3TMUXZ5t9eksVH1jObT/melU=;
Received: from p54ae91f2.dip0.t-ipconnect.de ([84.174.145.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kw23e-0001I0-IF; Sun, 03 Jan 2021 13:00:26 +0100
Subject: Re: [PATCH -next v4 01/13] mt76: mt7921: add module support
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
References: <cover.1609347310.git.objelf@gmail.com>
 <6efa97c619a5d2d2030c3f0c0da8e8a19b107feb.1609347310.git.objelf@gmail.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <e807a9e2-656c-83b3-31c5-4ff87766df48@nbd.name>
Date: Sun, 3 Jan 2021 13:00:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6efa97c619a5d2d2030c3f0c0da8e8a19b107feb.1609347310.git.objelf@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_070031_127323_BC4037DE 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, linux-wireless@vger.kernel.org, posh.sun@mediatek.com,
 YN.Chen@mediatek.com, linux-mediatek@lists.infradead.org,
 Soul.Huang@mediatek.com, Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-30 19:06, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add mt7921 as the pci driver module.
> 
> The purpose of the patch is to check about if the following patches are
> able to compile properly.
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
This should be the last patch in the series.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
