Return-Path: <SRS0=tRv5=PF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DEEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Oct 2021 13:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB6E61054
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Oct 2021 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AB6E61054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SCAahrGdNftDgT4zf3mN1cvGs7yDCfYrsFRJC6ohJg=; b=1W6TJStIBuOMwU
	9XmRG0bXquAgYQ5T0DoC6ABCNiKfB5D0z71rqA+8r1kSUffuAbwGvYde0V7I4y9+cKWHW/wj39eUO
	bdRXJeAII/m0GAzVQCK8yZxr5sQMtkrz3yBM8vAesY5ssJYJlV0OJlq9icgdWjsOAtUsrQUS97IvK
	09/9y7UlY1+dReGo/yxvsdxA8IbvKQ4FsrXLHTCOIB7f7SboNOcNmvzle/b9rSf1yVfd6BfkeuNkL
	gFg0EX4EH24e9YxLkqLlhoY3pZ5VL0RuTAfAC7Byr0CNI0QIooTg6XzsFPu0XNmfsEd5QypLTc8sn
	YTqfpyh1eSU1i8cDt0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mc6bV-00ChJm-GY; Sun, 17 Oct 2021 13:53:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mc6bI-00ChDn-Ml; Sun, 17 Oct 2021 13:53:21 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mc6au-0004Ux-Ep; Sun, 17 Oct 2021 15:52:58 +0200
Date: Sun, 17 Oct 2021 14:52:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Nick <vincent@systemli.org>, Kalle Valo <kvalo@codeaurora.org>,
 nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
Subject: Re: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Message-ID: <YWwqlk6rGbEp1obc@makrotopia.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
 <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
 <YWGXiExg1uBIFr2c@makrotopia.org>
 <trinity-b64203a5-8e23-4d1c-afd1-a29afa69f8f6-1634473696601@3c-app-gmx-bs33>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-b64203a5-8e23-4d1c-afd1-a29afa69f8f6-1634473696601@3c-app-gmx-bs33>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_065320_769034_D91859F6 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 17, 2021 at 02:28:16PM +0200, Frank Wunderlich wrote:
> > Gesendet: Samstag, 09. Oktober 2021 um 15:22 Uhr
> > Von: "Daniel Golle" <daniel@makrotopia.org>
> 
> > Does Mesh+AP or Ad-Hoc+AP also work on MT7622 and does it still work on
> > MT7615E card with your patch applied?
> 
> tested bananapi-r2 with mt7615 and bananapi-r64 with internal mt7622-wmac
> 
> ibss/ad-hoc: working
> AP-Mode: still working

Independently of each other or simultanously?
What I meant was to ask if **simultanous** Mesh+AP or Ad-Hoc+AP still
works on MT7615E (you can only test that with OpenWrt-patched hostapd
or by using wpa_supplicant to setup the AP as well as mesh/ad-hoc
interface by settings in wpa_supplicant.conf)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
