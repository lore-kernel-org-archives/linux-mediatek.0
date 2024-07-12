Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31233C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHNZglGn9/b39z3tmaX5Svu14CP7RJqj1nZ/VmCNtgk=; b=cwTOFFd/kz6n2aJifnfZElEXaf
	tCnVSFg3Fz6Y4srvbe9vzwtPGGAzoN4+U+ZAjwxhhuotEqqMOqJwcqq2VQ+vJVceng84M64S1a+Qe
	c9kbk+m/N+k9MaLQNXF9nhtbUlebeOg5ntDneeH9DHxID5Z1lzHmbE/hPy1wnc5nGFCkui7tX83cy
	RLAXqhpkY6d8W2kxwAN4vX1ybr59FtBSAcX0s04surJUEJkOdK+aPyDNPmRq1z6X5IO2lzs8tcZSZ
	ITYqQ8z6bRoIU7ADxVuWn4PNmTehUtBebEGx7IvVJlj5MZPO2gKe1lIUGmRiMMLuwn3YvdYjHm5K+
	LQVplm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDqQ-0000000HMFq-1Url;
	Fri, 12 Jul 2024 10:49:42 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDqM-0000000HMEk-3vAc
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 10:49:40 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so31437971fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jul 2024 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720781376; x=1721386176; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AHNZglGn9/b39z3tmaX5Svu14CP7RJqj1nZ/VmCNtgk=;
        b=g6XFDgfYvELN3xDwUiXH7fV8HIOfWSiw57ZP8x+rkbN932MjVo6XtdlU+aIDxEez1n
         NCOAtfN7obOwfh22Mo56ODDtJIzg6MqjXTTevFWv9h00ep9k2EHgiLyvis0z3yERm78Y
         oKv+8xiuQcFzb29Z1tNo4HsHuaK6J6tEvMZUQcaT2s2UapL2IoFqF6k3mz2LOFZQRt+k
         gmvEw+uOskF9/eUNmsA0K5oFfwM01sEvy+s0I5xKr4i9wJhMq6LRrDeLwP6Dyk/mmlUb
         NQ5bNrwWyZXaewYzMik9Vvi9FzeU+IUXhhuesdmbXbusRJRfbnRn6978rad/H+ZI99v+
         CXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781376; x=1721386176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHNZglGn9/b39z3tmaX5Svu14CP7RJqj1nZ/VmCNtgk=;
        b=P2TAl7lh05P8Kp4ZiVj+Qs01TBWgZl+95X/yo8v0xE4j54gcd+ay4NSEB5KjULZf7l
         1ySmtsL76/KMFb9Xb0yxlYM/LHLRiIrDaoHdr7LVmGa401g/qQiqL0e7ayyVjKc6av8v
         UnBCFI0C/4A7LMqRFP+JJNStqXt/tqdV+ilM4Eal5nDNeI2+9UYQ+EUsCVbC8/xNKM2Z
         cAEPsNpIQV0kIjYaP+86sAueBuKpDR1NTB9fZxY9QPtkwdo7J4TY8G0PSIV9Uh1+7/yv
         pWy4zyRpyPfaFJEntEW+cxBMPfBqe8RlTQlTqjWBaAf2zd86YqcHK7AMY1Q/Vc6tFOeM
         QaBA==
X-Forwarded-Encrypted: i=1; AJvYcCVjnX7cumEQpuMYXqanBC86QWZ3mINUA2+j3/ycPTsW1+mGO5FzkrGnGcFNQZ3ufWUTEyarc0FGIhoApgRIOx/4WALe8OEnjYeOoac6OHgPbFtp
X-Gm-Message-State: AOJu0YyLufR6E/tvPrJtA2K+wpn3poH0E02GRjUEKLvSZ/kkvpz0hW1i
	RARFETldy1xmLDKbkSMHTQekW2h4oNy+lXJp73EZ7Ow/en3in7Xi
X-Google-Smtp-Source: AGHT+IFaVuCcgov1TuLwUNSWWPnB5juRu3iKhpdZXsUUIEZvbsAKSYnn8VS94ZoTXu3lIU91P1E5Iw==
X-Received: by 2002:a2e:9e99:0:b0:2ec:6756:e3e7 with SMTP id 38308e7fff4ca-2eeb316b015mr90865261fa.40.1720781376172;
        Fri, 12 Jul 2024 03:49:36 -0700 (PDT)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bccbdsm334098666b.40.2024.07.12.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:49:35 -0700 (PDT)
Message-ID: <edbedd4e992dd0adb93adbd45a74614c4c0f626d.camel@gmail.com>
Subject: Re: [PATCH v1] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: Avri Altman <Avri.Altman@wdc.com>, "peter.wang@mediatek.com"
	 <peter.wang@mediatek.com>, "linux-scsi@vger.kernel.org"
	 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
	 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
	 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>, 
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>, "chaotian.jing@mediatek.com"
 <chaotian.jing@mediatek.com>, "jiajie.hao@mediatek.com"
 <jiajie.hao@mediatek.com>, "powen.kao@mediatek.com"
 <powen.kao@mediatek.com>,  "qilin.tan@mediatek.com"
 <qilin.tan@mediatek.com>, "lin.gui@mediatek.com" <lin.gui@mediatek.com>, 
 "tun-yu.yu@mediatek.com" <tun-yu.yu@mediatek.com>,
 "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, 
 "naomi.chu@mediatek.com" <naomi.chu@mediatek.com>, "chu.stanley@gmail.com"
 <chu.stanley@gmail.com>,  "beanhuo@micron.com" <beanhuo@micron.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Date: Fri, 12 Jul 2024 12:49:33 +0200
In-Reply-To: <DM6PR04MB6575B81B788F260A8C640684FCA62@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20240712094355.21572-1-peter.wang@mediatek.com>
	 <DM6PR04MB6575B81B788F260A8C640684FCA62@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_034938_997182_8CA7845F 
X-CRM114-Status: UNSURE (   8.09  )
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

On Fri, 2024-07-12 at 10:33 +0000, Avri Altman wrote:
> > @@ -8188,8 +8188,15 @@ static void ufshcd_rtc_work(struct
> > work_struct
> > *work)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hba =3D container_of(t=
o_delayed_work(work), struct ufs_hba,
> > ufs_rtc_update_work);
> Will returning here If (!ufshcd_is_ufs_dev_active(hba)) works?
> And remove it in the 2nd if clause?

Avri,=20

we need to reschedule next time work in the below code.  if return,
cannot.

whatelse I missed?

kind regards,=20
Bean

