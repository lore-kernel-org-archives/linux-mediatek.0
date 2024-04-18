Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97927C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdahcIlgWLXAJKCG0JqEYzoHe+XLbYJ/FlvNan0T5gk=; b=RPA72DAtJbZdh7BjpBWOycIaWd
	p1b74VSee/KFss8/8PRVHQZGxnUeZlgXEBqg0FnIPa6K9xPryotMXEFhrMfOEpEF1bjdBtaweyfM8
	/4K0SULMS2vi+K5zFqXCHmRpDukripEC5td+svz+Cti0yJT08wq3QkZGH6lDffGuIwkcFSOknEIo7
	zT3npgH5COG28aYK8/3hGmK8YE2ZbLgP69mpk5u9fqlkqim9TWzrq1k0vdEouAp5hdWG9hx4yBG7r
	5yn34FzFsffamW9PuGL29cZ+Yue95FXs9llSAu7+AV0z++AC/zeTkTK07PhWf5D8VreQy2jEV9cGl
	zJ8lDcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOGD-00000001epN-0wsG;
	Thu, 18 Apr 2024 09:40:53 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOGA-00000001ent-0Fg1
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 09:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713433236; x=1714038036; i=markus.elfring@web.de;
	bh=AdahcIlgWLXAJKCG0JqEYzoHe+XLbYJ/FlvNan0T5gk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JPtVj3UWRH/zitJgTYSWJ+X7L03KL9m8sCF6aMYs+2ZvKbh09iQ2dkfMjsHQ8xCK
	 gjvci9uB1nxKSsluB4hxX2LkEiovi/0u4ySHwsCHPqkGvKj9ijCn8hOThfKJB4nEq
	 9LMOtAEKK5EFVW5MHxHIQ+UTw/04wknLuqpEB/PhKh2vFhZUlhsVTW4ZQrnF9OK+Q
	 gKHFLYah3X4Ac3+Y4E+41UzcV/jFNK0VlUleWib5oRwZdCzddZr4dCGocurRnGetp
	 IaO4gTL8h7IDPTTJInDxD9623zbwHyx9OphQ5HozNLF60H7z2XOXHvrBOSqii3SW1
	 0UTBDtuhKwXw6wb5nQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1sLnxd2OXB-00OavU; Thu, 18
 Apr 2024 11:40:36 +0200
Message-ID: <cb593f2a-7dbe-44aa-b9ff-7fc57a4bd70a@web.de>
Date: Thu, 18 Apr 2024 11:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Chris Lu <chris.lu@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Deren Wu <deren.wu@mediatek.com>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Manish Mandlik <mmandlik@google.com>, Miao-chen Chou <mcchou@chromium.org>,
 Michael Sun <michaelfsun@google.com>, shawnku@google.com,
 frankgor@google.com, jsiuda@google.com
References: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
Subject: Re: [PATCH RESEND] Bluetooth: btusb: medaitek: fix double free of skb
 in coredump
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:h60MNVHZTjz4/QmEHPXP1WbPwsusvY2fbKtPn9WCziwqPyptPlc
 ber44onTYjIxTlQrcfVbWexacjHT3eiioX3yg37VqYA/7nnuaSxwjFeHrhE74xvoYT64tc2
 3Bx7x0020sHYynWpPs7rIOean2NNYeeYHgu9W3V01FD3Ay/7lpgcnd4zXRE3rnBDqHddr7i
 JELSN8JHpN9EF8kXS488g==
UI-OutboundReport: notjunk:1;M01:P0:41/oj+AA2Xs=;BgPgrSRQrxZusn4FIjnNLvOq+Zn
 Way5JznIXv0bGOXGZANPoP33fZwEyhiP+DOSSF0yK0z8jJqbR3cX9AChIL3SrlXTFm4DAcF9/
 tFk2IVrY5rnCwoxd5x2HigKs9h5/nX2uAYP52ITODcNEikAGbTQ4aAZIy8G1CX1eyHh9DelrR
 4nynCbeFHXqBLiB+yXNHLUBNWnOqgNJGVxLk03of5/Mk4WAkVAXUjogHa8J86rr7K9Eq8Whyr
 YapxCrQDUXJiHMUwKnJ3RuCugV7Ri5epnCKIXTY69hZoCKZ3tOaHAtiL7JvBsv/SGH+BCWwh6
 lEn9fBWqiLN5rkO5pKNUlzMCR01jJESrS2ct2uFraGLwYryaw7wD3YmrvSgl5LThotXpeQ/Hi
 FKwefg4ucDvQUrWqnLOTj1ANy8bLeQ4nTpN5GNxtNHAkIpOKqLAcI7P61Xsg1rNWfIkQcg7cc
 urlooCIzuygFbycqHrOB/XbPhyb4KuAJtuMpRJew4GaN9F/iOCHR1MP2v4TyHrdBp/C4lPIRT
 Jrk5o/Z0CQFBlIa01eGMNPwKA6j8TBDk9yyjWstfNhcppz3ylybstDNOtb4ae50fcDpF5vb6R
 BeN0GXDGYIzMietT+DZpVUicx1nnQFo9gZHvQjDZY2ntgUZTn9CVoGA7x7Vr/uarJTicehone
 PljgWkykcNWS5ph6B8uytPnv7tzNcRMpxaXBN0Wux4qziUggrqWsZhYLPYDC3b3rt+tdrDOiU
 A6HJhsAjKoGnvjYabnleJ+B3pvP/2ieQmU4d+mtuSzI9rf/a9cb8AcotaKHy/J1wqbbDAt+5A
 4FZhxvoQC0XbQrhJex5/2wk1KLUbc/lHwC8a4fD2CYjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_024050_693625_02730FD9 
X-CRM114-Status: UNSURE (   4.54  )
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

> hci_devcd_append() would free the skb on error so the caller don't
> have to free it again otherwise it would cause the double free of skb.

I hope that a typo will be avoided in the subsystem specification
for the final commit.

Regards,
Markus

