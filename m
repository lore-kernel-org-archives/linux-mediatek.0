Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429C8C3DA49
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jul 2024 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5oPaK50hH0OUi4IcBBa3W6X5fDJjIs1X5F+HgvqEM0=; b=24dkqWmoK6TKKlBAEIGVWp7J2s
	XH07mfXcPZ0YZucQ7kfNo1nvmyWKiG/11JtPMbdGc3Edj77fQk9lSCoYwuQLXXZ0qRnLGAPhbCY5c
	ksfoQC5XYOJkGeq2XKuUkna42VYF00oBO3zZcKnlLn8LAigMr/AiuzP9s4uqmAFlQVCZuSqRes3uL
	pvCD3rWolu3NTwJuquC0Kk5GhNRDiDtYDhatnTHFYOm5QBUyfbPhDFctFPTZ0o8ORxOM9coDMtITR
	gVvie/wvEIG+Am//CCpCWCG6IdoUfj1jEvhsxhNjCukcASgJUmPsU2RIzv+nTbJsnSaMSfXAGMx1w
	WgiI+qQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT7qs-00000005I5n-0kXB;
	Sun, 14 Jul 2024 22:37:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT7qo-00000005I5B-2D8x
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jul 2024 22:37:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so6125485a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jul 2024 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720996668; x=1721601468; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5oPaK50hH0OUi4IcBBa3W6X5fDJjIs1X5F+HgvqEM0=;
        b=XoI8aaWBdT5Sm+ffRLtvkzol4iDU21E54lyMvqj58URhzNCQXhZVRGuFv6uex6wtaL
         PJ9HOu18sc9FzqftyCT72775p/D4rTmKHUKAlkWdULHSi3xuoF0WbJ1IbRA0Rj3JPsiT
         3928w8z2csLuQuMCeXtIQJoA8LYDR757T5W4vvrLHfRnsTFwsL9Dn7mettjWOuJRi93f
         iS04pJDHjgz3OlfOfou2pTs2wHcdrGymyM2jCF7A3V8gBWtavZkQtq4ALc80hV5FER8+
         PYFjHV7+ZoVe8vp39b6RyTGtO5FQ/4V+99K/fTRG0cNJQhcly/7XrjzRqW8jNpulOfnP
         qCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720996668; x=1721601468;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5oPaK50hH0OUi4IcBBa3W6X5fDJjIs1X5F+HgvqEM0=;
        b=sHH0xmblDXPBRSCv17K7/Gb7EevTv8skBn+7Iz1v99FoQXptP7Hv3sx1bCdAb64UcA
         hnc9Usc1DyjvA5zBkz6iDJHZdv/zdZ3vNTagVzXJI4lnF3bFjOE7znOlgs50OtXa84XS
         lxxOXZeutZ/ZLLnNkFs5FFyvmGYht4kKaAouiQ70dV7//ww6CWvDQOZl/+cuhL3yHtN4
         a3f3X8qEmsgjh9YD0pQPWBWPLrGF+O+NcEnbrwXm3q9mGffSAZib8XBGKic2UhNecHEb
         XMR3qXlzR6wQsN8+sQw+w1OB+spkULTN34HYpuS/CEStdJG5l/lrD2H/sSrmasMal5P+
         IiPA==
X-Forwarded-Encrypted: i=1; AJvYcCXyXDyADW6GPMqrtGSOJAYxwtCQNxt3bd5f9n9ZpepmEoLaJ/tKwD3YJ0KDdC8moe5j9GOiEoT0UiRx84esEAERteHY6rNql8ndswsdxGtZ7cB7
X-Gm-Message-State: AOJu0YwLa8uqOrrv7wPvHe1adrwIzVvfzV7xUyMJOGtgfC9HRofnkqf1
	x7pX1P5IKNuv5XfqGmiT3rraYBE66rbp+WSSGPTjNGJeuV/EG3wi168SHf/n
X-Google-Smtp-Source: AGHT+IGfikxf3uYkA3ihL3m7OpjEXdkWnQeJ4rO+cfMqWgLctfm9bTFfdcI/nWgq5Yost4jV8ZqGnA==
X-Received: by 2002:a50:9996:0:b0:57d:6bb:d264 with SMTP id 4fb4d7f45d1cf-59a2427ef62mr6041760a12.1.1720996667868;
        Sun, 14 Jul 2024 15:37:47 -0700 (PDT)
Received: from p200300c58740f7b922c5ae1bb80e710f.dip0.t-ipconnect.de (p200300c58740f7b922c5ae1bb80e710f.dip0.t-ipconnect.de. [2003:c5:8740:f7b9:22c5:ae1b:b80e:710f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b255261c5sm2646635a12.43.2024.07.14.15.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 15:37:47 -0700 (PDT)
Message-ID: <de8b34e3a4055a545de4f6ee4321f968ccbfa0aa.camel@gmail.com>
Subject: Re: [PATCH v1] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>, peter.wang@mediatek.com, 
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 avri.altman@wdc.com,  alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 chu.stanley@gmail.com,  beanhuo@micron.com, stable@vger.kernel.org
Date: Mon, 15 Jul 2024 00:37:45 +0200
In-Reply-To: <d1d20f65-faa9-414f-b7fb-4b53794c0acb@acm.org>
References: <20240712094355.21572-1-peter.wang@mediatek.com>
	 <d1d20f65-faa9-414f-b7fb-4b53794c0acb@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_153750_596593_2E54E498 
X-CRM114-Status: GOOD (  22.09  )
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

On Fri, 2024-07-12 at 10:34 -0700, Bart Van Assche wrote:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Update RTC only when the=
re are no requests in progress
> > and UFSHCI is operational */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ufshcd_is_ufs_dev_busy(=
hba) && hba->ufshcd_state =3D=3D
> > UFSHCD_STATE_OPERATIONAL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Update RTC only whe=
n
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 1. there are no req=
uests in progress
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 2. UFSHCI is operat=
ional
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 3. pm operation is =
not in progress
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ufshcd_is_ufs_dev_busy(=
hba) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hba->ufsh=
cd_state =3D=3D UFSHCD_STATE_OPERATIONAL &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !hba->pm_=
op_in_progress)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ufshcd_update_rtc(hba);
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ufshcd_is_ufs_dev_a=
ctive(hba) && hba-
> > >dev_info.rtc_update_period)
>=20
> The above seems racy to me. I don't think there is any mechanism that
> prevents that hba->pm_op_in_progress is set after it has been checked
> and before ufshcd_update_rtc() is called. Has it been considered to
> add
> an ufshcd_rpm_get_sync_nowait() call before the hba-
> >pm_op_in_progress
> check and a ufshcd_rpm_put_sync() call after the ufshcd_update_rtc()
> call?
>=20
> Thanks,
>=20
> Bart.

Bart,

do you want this:

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-
priv.h
index ce36154ce963..2b74d6329b9d 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -311,6 +311,25 @@ static inline int ufshcd_update_ee_usr_mask(struct
ufs_hba *hba,
                                        &hba->ee_drv_mask, set, clr);
 }
=20
+static inline int ufshcd_rpm_get_sync_nowait(struct ufs_hba *hba)
+{
+       int ret =3D 0;
+       struct device *dev =3D &hba->ufs_device_wlun->sdev_gendev;
+
+       pm_runtime_get_noresume(dev);
+
+       /* Check if the device is already active */
+       if (pm_runtime_active(dev))
+               return 0;
+
+       /* Attempt to resume the device without blocking */
+       ret =3D pm_request_resume(dev);
+       if (ret < 0)
+               pm_runtime_put_noidle(dev);
+
+       return ret;
+}
+
 static inline int ufshcd_rpm_get_sync(struct ufs_hba *hba)
 {
        return pm_runtime_get_sync(&hba->ufs_device_wlun->sdev_gendev);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bea00e069e9a..1b7fc4ce9e5c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8209,10 +8209,8 @@ static void ufshcd_update_rtc(struct ufs_hba
*hba)
         */
        val =3D ts64.tv_sec - hba->dev_info.rtc_time_baseline;
=20
-       ufshcd_rpm_get_sync(hba);
        err =3D ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
QUERY_ATTR_IDN_SECONDS_PASSED,
                                0, 0, &val);
-       ufshcd_rpm_put_sync(hba);
=20
        if (err)
                dev_err(hba->dev, "%s: Failed to update rtc %d\n",
__func__, err);
@@ -8226,10 +8224,14 @@ static void ufshcd_rtc_work(struct work_struct
*work)
=20
        hba =3D container_of(to_delayed_work(work), struct ufs_hba,
ufs_rtc_update_work);
=20
+       if (ufshcd_rpm_get_sync_nowait(hba))
+               goto out;
+
         /* Update RTC only when there are no requests in progress and
UFSHCI is operational */
        if (!ufshcd_is_ufs_dev_busy(hba) && hba->ufshcd_state =3D=3D
UFSHCD_STATE_OPERATIONAL)
                ufshcd_update_rtc(hba);
-
+       ufshcd_rpm_put_sync(hba);
+out:
        if (ufshcd_is_ufs_dev_active(hba) && hba-
>dev_info.rtc_update_period)
                schedule_delayed_work(&hba->ufs_rtc_update_work,
                                      msecs_to_jiffies(hba-
>dev_info.rtc_update_period));
(END)




or can we change cancel_delayed_work_sync(&hba->ufs_rtc_update_work);
to cancel_delayed_work(&hba->ufs_rtc_update_work);  ??



kind regards,
Bean

