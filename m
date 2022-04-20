Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E03C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaJLOZdXXDvlqBuOGSE+yWzxYbfnO8qDGKkuivUJ5sA=; b=KZaSW4pLKIfKve
	Hqhr1SrexwoQaPXiVsQYL/Qx+L9i9pLwcr/Ppsgf10RaJmccTUq+MEmfeGV3mhltdiq/AwQf0QL8x
	ziUtSoZvYVSBvzdTOm6MZdaNe1jlYWfAUey6xlwcMLEdAl65p2OoCEZaLylj29AiVev1isiMEmU1n
	3+ie0RL+xA7c6fUbiC0svzSyy1nu7QEACM9SOqcGN+sXgVCTT8aMzR3fJpwBzEptrBpk2m/wJeNWz
	zFlu7eGVO6uVTBl3GzinAi37t9Sf3f37wrFGviiKhqOCYMGDofkUaOiS1Jt6OONql56+CyG/wIVXU
	p/jeP2mZMRbhUJuo/PsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7ya-008hlF-FR; Wed, 20 Apr 2022 10:54:24 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7yX-008hkh-Vt
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 10:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ByaG4RWHCrXJDRCrH0eRM21F8h0r29Z2Sw9BM35Ne/s=; b=fJf0utWWMZOnO46t5IYlh2dIKz
 18ZIHcrqj5oEGNdTeuh8aGBtlcxCwOv9NznRe3WkjMCx7/RMa/qzWkyyWsOC4O7JcCLv5PXGkfCNu
 PjxPt25wT+K39LOj+nQCdwhCwcdrdBHt6MfKgApfQF/IlACSeNPupL8lGo/LboIR7LE0=;
Received: from p200300daa70ef200009e86881025829d.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:9e:8688:1025:829d] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nh7yQ-0005OS-B0; Wed, 20 Apr 2022 12:54:14 +0200
Message-ID: <90e39a67-b765-1c88-384c-9a7873274163@nbd.name>
Date: Wed, 20 Apr 2022 12:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] mt76: fix antenna config missing in 6G cap
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <357763fe0b112838d500422a27b114b4281adb9a.1649511465.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <357763fe0b112838d500422a27b114b4281adb9a.1649511465.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_035422_232242_0F98DAA3 
X-CRM114-Status: UNSURE (   6.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09.04.22 15:44, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> To make sure we have the proper antenna config in 6g cap,
> move IEEE80211_VHT_CAP_[T/R]X_ANTENNA_PATTERN to stream init.
> 
> Fixes: f1103fa6b3492 ("mt76: add TX/RX antenna pattern capabilities")
The fixes line is wrong, since that commit is older than 6G support in 
mt76. I will change it to this instead:
Fixes: edf9dab8ba27 ("mt76: add 6GHz support")

Thanks,

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
