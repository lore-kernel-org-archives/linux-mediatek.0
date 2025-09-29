Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC5CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePSHRlaS/eSgksUpCLyFhAOnNFBDP6Dqx8LpL3KyfT4=; b=w5G6Rr7SwtZvUEv8Bvk8MU+D99
	54q4AEcOBDCBw6zXu3bXnDh7PmMlFvvsJlYMMl+4wj/w1uzo7I4wkSe9/Zo1d0Q907bdN3fD8JxIS
	8MAKw0OZ0z6XByIrTWtetg1zRCUkKvj7erhwkDJoiQIIQYMoizuTHbYhjxNxZvMQo9Wiruj3YM+5c
	kmqIN+42d55EMSF8FOoe1WthCMVKMXyFPF7wHmyup7mMfzde6bTnA23z4+hNkXvtWQcGKmcmlLecC
	r8LznzEfPOuB9ZU3GuTFRfFBCnqJCdM6/whBAfMQMdbGmG2CIAjaa/TZ70i3FzWb1DjFLCPH56Fe4
	WzfDihSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DbM-00000002WVL-43Wy;
	Mon, 29 Sep 2025 13:07:36 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DbK-00000002WUw-0epj
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 13:07:35 +0000
DKIM-Signature: a=rsa-sha256; b=Z8zJLmUrujzyps9Ep0agW01+IZnNONUhsR02MrPe4C2h6y82Rr2VA1suLgLqviwbUqRdNBEvRfKrtov0IuhtFjWrViewywGL6/lVsq9vHsUFrOitp4I0BBHGR9Zfj+g/LPK5+RFMoDlDJNEislx4nZO/k81BlucTsuRGcKa+WObuhW1NsC/B41oPPaiBrOhe0hdqQvpY01sYbk7rQ1r5+bMzv5TeADq46kYo+WaPVB/vL/H81G8NgzkuRkRTWaIC4CgAfZB6+6F3GuK17k9x0M+OaMVPTHeaDx7P/DK6Ug7GbevMSiFNLJF8F6D0Q19nSpwsrAZRHJYQzp06EvM/Fg==; s=purelymail2; d=purelymail.com; v=1; bh=ePSHRlaS/eSgksUpCLyFhAOnNFBDP6Dqx8LpL3KyfT4=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-mediatek@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -730556520;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 29 Sep 2025 13:07:28 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 15:07:27 +0200
Message-Id: <DD5B2MK444DP.BA3ZBBY5Z6HZ@mentallysanemainliners.org>
Subject: Re: [PATCH v5 0/8]  Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_060734_291747_2FB294E4 
X-CRM114-Status: UNSURE (   8.15  )
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

On Tue Jul 15, 2025 at 4:02 PM CEST, AngeloGioacchino Del Regno wrote:
> This series adds support for three new MediaTek PMICs: MT6316, MT6363
> and MT6373 and their variants - used in board designs featuring the
> MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
> SoC.
>

Hi Angelo,

Apologies for asking, but is there any future for this series? I
understand you as a MediaTek maintainer have a lot of work on your head -
however as part of my MT6878 upstreaming work, getting this series merged
would really be beneficial.

I only have MT6363 (well, also 6685, 6319 and 6369, but expect a
seperate patchset for these) on my platform, so I'm unable to pick up=20
the work for other PMICs anyway.

Thanks and regards,
Igor

