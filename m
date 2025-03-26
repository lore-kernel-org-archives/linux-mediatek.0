Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB95C3600C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Mar 2025 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+5GHuIzTPyTZ2uB1s3xkoFmmaBjSze2gDJ2FB0UHFE=; b=beAEw2FZuohSODnDLzS9fLmeX7
	molnzDTCrCvykWhTxZt6ATq9beuqnQ93Gw7sXdiqxnr6VSsiiaDMlA4AEnkg8hOSSDVUwJNkoFAE+
	1eFiZfXK+B9ro7O/eF3SQVzUmsZvZEKSIOv4MqVgjNYIo633rFXJpUUPCs8DfRL5U6mQiB3qVUqhc
	nPOqGnTTjkNinJkVd5/0RZuXaa4qO9Nu2NXKkykklyd+cwRbBIswLpjyLWDzpLA56GerQdxGZisyo
	eVMOwUBg9E/ZLgqACps4X8lRphZISVlQjqoeDb4gkwSFMDqyi12TSPo5/+/3OOQ89PIW9E0yfaNeW
	CUTAaULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOMg-00000008HLP-0xMI;
	Wed, 26 Mar 2025 10:52:06 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOKv-00000008H8L-3zck;
	Wed, 26 Mar 2025 10:50:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZN3TR5RTnzm1Hcf;
	Wed, 26 Mar 2025 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742986200; x=1745578201; bh=5+5GHuIzTPyTZ2uB1s3xkoFm
	maBjSze2gDJ2FB0UHFE=; b=HievZawn2d6jsnrVOsia7WD6sGZyUjHmr8S4WY6Z
	TwsnilVL6ShQXcK7AgonBwUePRPKn+LWasFjh6Hp3M4nWoNsw0NSyGP/jld+GKXp
	eHa/q6Bj/ky6J5scjMn1U7cRelzxrOPARMgqARwG/q/8dwjGj2CBIvfD2YuONKv6
	zVzxFUwPm3RJJ9cPhJ3wkDS0YsE3VHC2s+fjS1PBiDul2knJL07CM4m4PgvqkZRt
	TAdBWfPSfoP/u3BfHpx6aegF7hwOf0Hi8yema1WKprKalWts0fHVuynWfYWF3CKj
	QPVb7FQUFcVP28LFJeuSdBJ6YKMK0mflJv924VYFjryoTQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kw46iLVboy79; Wed, 26 Mar 2025 10:50:00 +0000 (UTC)
Received: from [172.22.32.156] (unknown [99.209.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZN3T5620nzm1Hc8;
	Wed, 26 Mar 2025 10:49:44 +0000 (UTC)
Message-ID: <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
Date: Wed, 26 Mar 2025 06:49:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Arthur Simchaev <Arthur.Simchaev@sandisk.com>,
 "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
 "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "minwoo.im@samsung.com" <minwoo.im@samsung.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bean Huo <beanhuo@micron.com>, Keoseong Park <keosung.park@samsung.com>,
 Ziqi Chen <quic_ziqichen@quicinc.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Gwendal Grignou <gwendal@chromium.org>, Eric Biggers <ebiggers@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_035018_059190_D9DA9123 
X-CRM114-Status: GOOD (  11.55  )
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

On 3/25/25 6:15 PM, Bao D. Nguyen wrote:
> The existing "struct utp_upiu_query_v4_0" probably has a bug in it. It=20
> does not use the=C2=A0 __attribute__((__packed__)) attribute. The compi=
ler is=20
> free to add padding in this structure, resulting in the read attribute=20
> value being incorrect. I plan to provide a separate patch to fix this=20
> issue.

Adding __attribute__((__packed__)) or __packed to data structures that
don't need it is not an improvement but is a change that makes
processing slower on architectures that do not support unaligned
accesses. Instead of adding __packed to data structures in their
entirety, only add it to those members that need it and check the
structure size as follows:

static_assert(sizeof(...) =3D=3D ...);

Thanks,

Bart.

