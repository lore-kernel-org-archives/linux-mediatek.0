Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E418CC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Slvd9WP7U67G3VLT+aHOxvttY9ZS+l7ClciTen+Yuc=; b=guNwk2RjfpDiJIm2oquQpHZCzB
	mwJbXvbKHfGGfxiVQNXmtCvyvH6NOednvANPGG98Knal/4vKW2QZJTudHBKqLlbqO9fKt4vXjfTgo
	2b10MBlSog3FZJsPkcJ5Jd4L9LxplKvjkE7lEXLJJ14Mj0ChiVmupL/NY/It48tc6O8nj6NyXRMSB
	3fEYIYkKp7sxvL4TC87b+p/DmaQQ1RCDupo68PM+7aCyetj6lKSD69+HtiIsFweVUSaNY4uIKsCcp
	ftiHDih4onShCWzwFHxLIHK5BoTTf3PRS1FULqEuUzTZXSKf8DEP4QvdxIgK16JryEzwyKAIJoj/F
	y+N3vAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxuMJ-00000006qLY-13Bf;
	Fri, 19 Apr 2024 19:57:19 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxuMF-00000006qKm-0N54
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 19:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713556618; x=1714161418; i=markus.elfring@web.de;
	bh=6Slvd9WP7U67G3VLT+aHOxvttY9ZS+l7ClciTen+Yuc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CLbRyo9dzVNhQ3oFILxFVfdLxwMaG3MUlxRpvJgCTD1G9ABfqDyZAaKKlca6DWgF
	 sUH440ZnySvzqm3nJtym8DEy0RYN0RnysfrYqmQFYQQ2FUNZak8cf43dZpbEU/bGr
	 VmzjnhSdI2yhmn+UpUdL/4LwsthQOrGwY62rWUTijMI7POVNa0bug5XwMvdQJe61z
	 rTOxqYltHt5eV/V6oKrIXMcAThdlRjAFsvSWgLhhOJ98EuDaafNAK1rFGqHQpvhZD
	 tgeFAz2X3LrfV+/HFE1+8Fen7LoGUnt3hpY+0v9VMgPNzhWvqCrQ1IHBHLijk2X89
	 D/+Re9p4sJeT8oC19w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHVaf-1rtptb2Crx-00DV2a; Fri, 19
 Apr 2024 21:56:58 +0200
Message-ID: <0460d898-689f-4e9a-bd2a-a812ca54acc4@web.de>
Date: Fri, 19 Apr 2024 21:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bluetooth: btusb: medaitek: fix double free of skb in coredump
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, LKML <linux-kernel@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Chris Lu <chris.lu@mediatek.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Deren Wu <deren.wu@mediatek.com>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Manish Mandlik <mmandlik@google.com>, Miao-chen Chou <mcchou@chromium.org>,
 Michael Sun <michaelfsun@google.com>, shawnku@google.com,
 frankgor@google.com, jsiuda@google.com
References: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
 <cb593f2a-7dbe-44aa-b9ff-7fc57a4bd70a@web.de>
 <CABBYNZL1=RyzuXcDpAwcXyOe_8Bh4gJtDzKdS55-3ZF4rZRj7A@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CABBYNZL1=RyzuXcDpAwcXyOe_8Bh4gJtDzKdS55-3ZF4rZRj7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S8WVsoPLtqYG/ykvrpdfXwxTb9GQ6ddC7R7zsOQbPfIOAPVg5bH
 cMPj7nuSOAH+vCBx5OH4wb42KGMA6DWS72RdGxaVQ6GogDsV6zx1u9KXKVPQ6WDqKqmppbs
 vxrwA7C9+GYDicbVt/kTg85dLhkoRSq0ycv2rJslHIS1PtxilV0j5WC27ds1+k8kIdd178e
 Uw04abQuIawH3E6PHXxXg==
UI-OutboundReport: notjunk:1;M01:P0:0SfpuT7Zf8o=;uZUyp+Nr+hFB7lgbCA8xf5U6SOd
 G6jAFLKGPouMeLYW4ECJ9Nj3ptXypcKX5dsGcaY4cgMYcFcjmm1XlEuevFyYL99tscs8ucgsb
 2TCitR49unAcRFalK8OpUepLM+sxcAp8D85ZpEeiQjzGsQ09JyVdC7K3bOOX9azTYS+NJLuTH
 2QS0weenCJIYoUNbGo5ibW5MTm57SYaxyqTbbzPw03xkWt3Ocl5Ggl6GhNVhsusXSbuBZvK1D
 /edJ3mSUaeEwXQm+2slS9GfpYmCm4HQS/MCt8/1thcYEF7urQCd7pJNfYag4CpESUib3cwygn
 GE/kqPk41/7ldFc4gUhfLRce35yrIzXg9W44EfjQVkPsxYTdEBWxV68yshYOo+pfr6GVsTFbC
 h6mxd3WUJx3j7rZUIykxOLFxoVSFL2bTDPMdyhlstEV+IaxoW5fxKe4RCJKBmNi4qgxuHq6RA
 JqtZkeI80XrK5wiEb0KLHj/uapL9LgO/JTh8dVBNkRr0F+qnAnRtepTQpMODMIAEv+ovtVv5c
 kdqZJ7u/YqZflNTruCf63ZvkjsvDyel/8TqnZ496NZNXTft8Rb+zflWEzJgOOXmxACrI7kvoB
 7FidVNYsshtC2l+ebPjq7MB7ubEzlRtbIn6J86VKKkV2ST6v/fYbABAV47XHi1fHLg1X+EzPm
 ekgotMOoGSVlHZet9dCO4ydT7+Vc/dmku7qn2wBEV9r+sL3eV3L1XepaoYD4Yw8avZBtzV3VF
 ttrwDx8L+s3sQWwPHOOHeNgLe6LhEmT0YtDfRmwxl2b4yr7U9KHv4jv92Y25a3sbysuYYRbf/
 NNcKcS6YOo/M7ZUFUzPuFUuc4XphAToefC6dayaYh+mzw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_125715_438490_88AB6996 
X-CRM114-Status: UNSURE (   3.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>> I hope that a typo will be avoided in the subsystem specification
>> for the final commit.
>
> Are you talking about medaitek

Yes.

Do you prefer references for mediatek here?


> or is there another typo?

Not yet.

Regards,
Markus

