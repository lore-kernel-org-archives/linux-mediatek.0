Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E09AC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 14:38:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F3E613CC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 14:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F3E613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:MIME-Version:
	References:In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yccdrd3LmosidxS2Xytb7t0Od0alwiosn4NR1eKZvO8=; b=AzNt+pPKyVnXX9GxM1tbq153r
	F+1MayxZyQg1QR0GTwx4EUc0XECRjsaHihoiDcH5BZOLI+axDZ4C/74Hr3hP6v5bQHHIiRcFBQWwz
	MjRVuVz0pBuf+uc+I0s7+Twfv8ay2AmgccjdoL0HjS8fTaLrxew+7n4UfeMpApAPnBt2VjL39u/g9
	HfTO23iC2/0i7ifBDSz+fuJs0NuHVQvKYuY+NbEcDN3HuWAfpsatt8vj5/LrrcyI91rPST83QrHxo
	uRknJ2b+7NmSUOHTKQnS6GyEM6TCpw0YTO5oXCUywYCbQVMqaI8rcgFE6EdoK0LCAy8U93bSF6wVd
	eEoPiBZAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcUHu-007zPl-Sk; Fri, 30 Apr 2021 14:38:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcUHi-007zMJ-7k; Fri, 30 Apr 2021 14:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:From:CC:To:Reply-to:
 Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Sender:Content-ID:Content-Description;
 bh=cfsGfW8WX6Q1unP1IHR/X/PhgVV2sUsIKvQxdQwtyX8=; b=Tkq1d3iQ39ULKN2rVuKdElUCOa
 2HpVa1dPge1bGu5ggMa/XKVxc+llfKZ2DK3flU4pZ4oEN7lXnCaW8EH0rzwmCzW/vocXsV+WbQYiL
 LMavN2pnQiUqNbOrxuN48RaPdz1/9JEd2rhMBTwIfBlRcad9Rtdefl08nOkLR6QTWhYEDk6E7EfeX
 l+iLWoE6QPg3pMCfslH99Icz8SUwYtxVRrnbeFLrkFQaWAgt/UZsn8liOCBONls37Mdc9+3Fyl/mB
 BWVxoxtDyDbCM4W/K/8wdXPBXLHJS5yGsgEKcbXDjBb8qPl13GRcv1LezOKHVfYfeIz53WyjnFht3
 vOpFkRCg==;
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcUHf-001Ram-7T; Fri, 30 Apr 2021 14:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619793490;
 bh=cfsGfW8WX6Q1unP1IHR/X/PhgVV2sUsIKvQxdQwtyX8=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=HQBZa5+tUjuIgooJ+8YW9EtivqwxdfhwbqCCSivrEjZabG6lpJmTgXY/osn8xnpGj
 B2WwOXvpCk8W0PtgM1ZIgPcohTw96nIOrZq2tbtemuMZpsHLBmvcJSlJVcfAXo1tIH
 P8xyePnpsgPA+b16YXRLT1Je08VsmtuC0/QDcTTw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([157.180.225.50]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1m4cii1Zb4-00Yf3b; Fri, 30
 Apr 2021 16:38:10 +0200
Date: Fri, 30 Apr 2021 16:38:03 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <YIwMvUVmeeYT1aph@kroah.com>
References: <20210430124317.97376-1-linux@fw-web.de>
 <YIv969BCnPgXzrcg@kroah.com>
 <trinity-5166e76d-779d-4b05-870b-59971bd1571c-1619789439850@3c-app-gmx-bap03>
 <YIwMvUVmeeYT1aph@kroah.com>
MIME-Version: 1.0
Subject: Re: Re: [PATCH] musb: mediatek: rename driver
To: linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Frank Wunderlich <linux@fw-web.de>, Bin Liu <b-liu@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Miller <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <16ABF577-4EE1-4BB3-A801-A4498CBFCFCE@public-files.de>
X-Provags-ID: V03:K1:nNdIy1J9VWHYvq27v3HRerK9WoB1HhAi5teVaPMzkMUr3nXD7bw
 pLyTYd5blwokALBrPe2HaQ7qyIQDPU6ZAkLsx1Aie3HaNoc4Hj9fEfliiMEsWbMugL67aYH
 BgHlUUjb3G0FN4+M6pcpL7MgSBDQA/v0afJbv+ILs3IIIZ/VI8VN2EacMLplH9P7UwAbcAI
 bTRqWJdcqP2SKCfY8EwmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4C+fKdX9Ows=:f28tvbwSYFV+fvbGFRkpaN
 UcyTVD3rW+h008YUpiLGiH2EIXpWYvuzGk2ewQNCo6BrlCaAndNP/m65wU4CjB5KHBtdjhcpz
 RKXouVpBnjLl4yZOXQ/OglmcWLNINJj/EsOYa40ZqRS7+cHTehqRX3MgoxVyFWajPIwROQJCj
 8+pNr9JkLP9+x5Mn8VZOmTrUWZGLbldTF+i+yx6Wlm44XU5H3A3HSBoHGHXwKW/wGfslzaYnJ
 95jRi69e8lN6swEz7TK5nH15JdGmRDjrRvgXH+ZI9NBAiQnwHUOTEJxm87b6POM7vqaRHXITf
 5w1YI8jKLhj3jC7ITCcDjNl7SCSt/rppLNIVCnVtYmsbpObhqaypxportYBHw2120GcAqBZ/v
 ZUCGQJsKhkjvhW2lIJQnKtJo/wCdb2jOdHylq9AAeH3anke6YSbGnTGqyLGO2nKG4tBSHk3xN
 ZA1s9Fvgr5eW0Ixd34FQy1eXGUSX5VlBGfTZTKBpZe52hCQT5o+Zx/Td1caY5tTsn8f/ovm0e
 yvIGKPW7Y6/myarxtuhwcZln6zQ21uEvhjaHNzDY4TbFZ6E8NfWRWccw3HXijTpmfsKVsbFl0
 vjq+6d0oAPxFDzPevnuqAbdK+qRcs9ndNZ28FNc3NzXNRbtdfLgv08/DRhi/SrExKfk9MpU7S
 BEAWZihazoZf4MdMeRwjhCDPH/Mj2U5RHex6BuuIjg19kEo5zG6pY9uQDJ7i+94f2+T/s5Dct
 VIp1HW+UfY6tAb98biT3gQ6qZRa2W/DUZyD602/nRUJ0VS2B6zVDVUitwYa8XDUhH/VQClxYV
 fTZqYOywuMI0j+SupcpVyVMMy0Ox9oaWhCTQiOB2VCYjm1tFdHO8CxDESEvGgS9jkp782bccx
 vPUhZ13I1DVeeL3bv7lKaCaLkZDCZVkDQezbZcKPw58Tw6XpdGmvCdCRt93PGjG48Sr5G0Ok3
 vy1EPowUdY5qeuZJ5q9QBk8Z2NGx9rRjX46pECyNH0ZZm1EhUOmatHfApNsbjcVb7pA9mE5NN
 7SvkUXBwCASnlwA2RRfoRUh9E2V/4DK1+t2ek0oceIFUU14Ezy058YCJchTRMdw671my8MSwU
 NrxP2hDuRhd5VZfFhi/YvTzFqht39Tx75b2K0GChvboHclQxhd/rZ+dLd6A002zsi8tIF6kZr
 qGDF62Tu0nRe5PqrrBl0ozuTthkhxDs3vNGJjW7nW6vaQiVNoUs5pkgpb/dPewFBQ2ED/g4qM
 pw7vU6a1sjlNOp2ki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_073823_622273_163F9D78 
X-CRM114-Status: GOOD (  12.58  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 30. April 2021 15:57:17 MESZ schrieb Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

>Why not just have any new driver not use this name, as it is, it's not
>hurting anything.

I just want to make it clean for users/admins for what kind of device this module is for (vendor.ko is imho not good at least for vendors manufacturing such different devices).
And avoid such conflicts like the phy (which had reintroduced the unclear module name).
The new module will be renamed in next version..there is only discussion about the new name...and so i tried to fix the "other end".

>Until you can guarantee that renaming this is not
>going to break anything, I can not take it.

If a user/administrator installs a new major kernel version he needs to check if all is still working. Then the new module can be loaded...i don't see a real breakage or much work for "fix" this,but it's ok if you do not take it up.

This driver is afair available since 5.4 so i guess not much spreading in large productive environments mostly still using 4.14 or 4.4

I can repost with better description,but this is not needed if change itself will be rejected. So maybe anyone else can comment too.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
