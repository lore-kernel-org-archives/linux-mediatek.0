Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61BBC44500
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:From:Cc:Subject:To:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObC9OwRxOMV1pm3KyljcyooxBRThvnIdSuo4lp1vHn0=; b=gCylCSdaPFbl+a7mkUvi4A/BxL
	Q2VBZKiuYMYCz1AjJbJVleOmcsqnMZnxTbbzu3d0HRHmTxRor667JeaX+cW4ezJDzCWDsq1zmWefx
	syv1yr7MwrlKg5oADMk9IXHQfGjsi41qzf65q39a3T7Gmu337ZgbjhGFF/fAd6/G+T1Rg/XF4Tncd
	a6NbHNCIf+7uRIcfS4h7OFR7vezXlgOF6q2nGlu6DQC0G8vOlYrkfrafrJp4lzCycPhpkg7hhdcMt
	zOhsyg4xZ0QtiBQm0Q6P4bMESdMabJUbDGpRUiCO/LJyd4MQr/CjALi5I+ktnHufLAzQ6mFfXMjpN
	4tQt3BjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkub-0000000CqHz-1vrk;
	Mon, 06 Jul 2026 15:07:09 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkuZ-0000000CqHB-0KbG
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:07:09 +0000
DKIM-Signature: a=rsa-sha256; b=Vf6itBlKxB6l6Us3jkVkauWXmLtgJRnbJ9tDT+Vv/54zNAdQpf54yjhOjlmp7/paoN1Jc79WG/tYAI0X5pB1GCDSRdAZPxqmYTGProrS8PnVxu2hklsA2BFtOztuwDO15ZL4InO+EbmHOIspfYF/3AS6gcbVhrNjbkV0JCBPvzvNM+5+nZLnAjuJHhbe/eEA0nh2EJNQqpIKxOBbdPTm1bMgz0o42XcDHTmZO+nF17ehb9hVyKK4xiJFe9jm5+ybHUyrdGsINA17RKcWdujWsSR4NMxUUEHNJfRyHFhK13A90OvSH9A10Bawqgyq8uWH9NtPfNKE2IiLDcQ7UeDJkA==; s=purelymail3; d=rcpassos.me; v=1; bh=ObC9OwRxOMV1pm3KyljcyooxBRThvnIdSuo4lp1vHn0=; h=Received:Date:To:Subject:From;
DKIM-Signature: a=rsa-sha256; b=MSCw5BQPA6Mk6wZnqLFNiT1f4+lYBoM8eot/AnknIv+g9XQ/s5OnQCMYiO5u1vAZzR4rHT+S4DYgVbDrjQLYKTSt3CktupbZ/LV0R7qFPnEGMlY/OiaqrxJCZ4P11RrQQIS0H0Ts1TiC+70/iMCGKCU5qwwyc7G/JmyS4eA12HnlQoe7qJzGU5OYqTzyUxnp9A6TF/MaMgFhAtLBi40kvJSzC+mKVOJGX4Har96I1azlbgY2FhU1eCcJJYbnMi4ASgBOPTrZJx+a4z3g27/v8mJ5kcVum8yOzOQGfjiCyZV/hor41nVbXOpxU2Ui7usVKw37ZhyWHKx72XTOr48jRA==; s=purelymail3; d=purelymail.com; v=1; bh=ObC9OwRxOMV1pm3KyljcyooxBRThvnIdSuo4lp1vHn0=; h=Feedback-ID:Received:Date:To:Subject:From;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-mediatek@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1093595095;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 06 Jul 2026 15:06:57 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:06:54 -0300
Message-Id: <DJRKYMIBYSWD.778JD1HG7W7S@rcpassos.me>
To: "JB Tsai" <jb.tsai@mediatek.com>, <nbd@nbd.name>, <lorenzo@kernel.org>
Subject: Re: [PATCH] wifi: mt76: mt7925: Fix unregister deadlock
Cc: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
 <Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
 <litien.chang@mediatek.com>, "Fei Shao" <fshao@google.com>
From: "Rafael Passos" <rafael@rcpassos.me>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260630090610.586954-1-jb.tsai@mediatek.com>
In-Reply-To: <20260630090610.586954-1-jb.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080707_204631_6652D7D5 
X-CRM114-Status: UNSURE (   4.89  )
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

I was having issues with the MT7925 on the ASRock B850M with Bluetooth.
I tested this and other patches in my investigation.
My issue was a platform bug causing a failure in USB enumeration
before the driver path (unrelated to the patch).

I can confirm this patch does not introduce regressions on this platform.
I tested system power cycling and suspension, BT/Wifi adapter enable/disabl=
e,
and also modprobing in/out mt7925{e/u}
Patch applied on top of mailine (7.2 rc1).

Tested-by: Rafael Passos <rafael@rcpassos.me>

Thanks,
Rafael Passos

