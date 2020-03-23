Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5359FC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 17:35:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD7720714
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 17:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gqghyr4i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="RdjUigrm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD7720714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XI1MpHSK6vrEyMOgMTK7Tribu0ODV++HFBoM3WHIELw=; b=Gqghyr4iQrX7ZU
	J6J1+k4LApegfopd4cTLcB1hcc9NjJsBQxnLGxykVqWmqhpC8HiRcAzI0Te0XWO6TOOxRAlahcTki
	Nh15xxPg1fSFYBWXzr0kq8sqJXB71eHR07P7X15/GqMcIQ762yDsJHelAQu57e2Fz7OjbUrH9xwnK
	naUy5bOrh4CjHhSQzljQ0RZr1K5Kenc25pvsfUOXjNKzkSgcyIWWoGU+zzb0xlBl42ruc2fy4mlMe
	rBrYF+uHWz3+MRT10ZY9HhfOMNb01bkP1Ok/eMpbYZttL32dId9aL8jb9D2k6ZFQh+bQvgegfichb
	YSp42l5nSwMHxUf/1XTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGQyx-0004Un-8f; Mon, 23 Mar 2020 17:35:23 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGQyu-0004Tw-4I
 for linux-mediatek@lists.infradead.org; Mon, 23 Mar 2020 17:35:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584984920; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=cmqVjReZrg/0rOUQjghrITou1WyAcRf1WVuEB5WzkCw=;
 b=RdjUigrmNYFl/o780wK4lOk6nrhuCV15UK9UTNCDnH1+DaxGD4QXf8hDoQunC8IhxrtECKIn
 Ir4CRWe1XT8cpMD78sPeZ2WC6xXF+RJArmRgYEx6RtUE/KXwE8uWBr98qZLmTN5LSSPIc+xf
 11i0J7a2MYn1bZXiQ4BC5xe4Dro=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78f350.7f3257fa0068-smtp-out-n04;
 Mon, 23 Mar 2020 17:35:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F102C432C2; Mon, 23 Mar 2020 17:35:11 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F015C433CB;
 Mon, 23 Mar 2020 17:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F015C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] mt76: mt7615: fix mt7663e firmware struct endianness
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <d14dfd7cd91a4dda8c5dcd03e8a70ff11314182e.1584534454.git.lorenzo@kernel.org>
References: <d14dfd7cd91a4dda8c5dcd03e8a70ff11314182e.1584534454.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20200323173511.8F102C432C2@smtp.codeaurora.org>
Date: Mon, 23 Mar 2020 17:35:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_103520_680326_570DAF3B 
X-CRM114-Status: UNSURE (   6.80  )
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
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Convert fields in mt7663_fw_trailer and mt7663_fw_buf to little-endian
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

3 patches applied to wireless-drivers-next.git, thanks.

54178cc134fd mt76: mt7615: fix mt7663e firmware struct endianness
d14f0a5c62d3 mt76: mt7615: fix endianness in unified command
b899150e60ce mt76: mt7615: add missing declaration in mt7615.h

-- 
https://patchwork.kernel.org/patch/11445177/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
