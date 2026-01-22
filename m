Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD95C44500
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=; b=qTAkS6JVnLdBRCd17FDvZADsQh
	FR38XT6zreoXJcRc55zvEaKxS3byry2jmVHbAze4BgPsNBSjjp2SJ7Jpm6eDifElNU5jmiPNdpLd2
	hY1agaSEjMEvEk8WMqJfiI0mOg+eTT3sr/6tH7EIS//eYxxXjriXhVsJGZp7u4EXEwuz0g9YP0CWt
	8ccPtH91wmDeyJNaqJz8MjatMl8C8S5TzLxHgNH0v64ThKkEhqaCMdpF5Fd8HAlsWr5g6FjyZ/w6D
	W65SBjnVVuLTAJt9T+ZaZpLU0iWF1Z4h1DkhYkwOwjjgZe7sr3UBsNKAkOodfFNg+WiRRnbivq4Wr
	rnFQ0Fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqPA-00000006gL2-3KjK;
	Thu, 22 Jan 2026 08:51:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqP9-00000006gKF-0ClW
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 08:51:04 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59b67388c9cso758760e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Jan 2026 00:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769071861; cv=none;
        d=google.com; s=arc-20240605;
        b=L0uhrB/vmOcleFQkk4q++8Aq568ZM12D3zpVj8SBQurY4ftLTEZVUQEh940l3/bCCB
         laTQtMpMpaLgRSAeJTAplAJjryhLFA7dJQHJ3l+mDoWLVCj/ZY8j/b0fq/LaGH/iCuYb
         NbUq46F98QUG5Jp2D8dtJ+LLdX/WB4mciZC3SDP4uY7WgEEvrzIuM3eiSefIKrc/Y1c4
         PAV2yhOqI62Sze+R/puMsjKasA1/0FSa2Tl1mzh41fAJLCP8F+7YVX5SsD7oXVg7AF7V
         kL1wyJzY007nhEyZf2baj6TAZNZlYcrMFlpeCf6uLdhbBN3Kewa+yB/5B43Qyn4lsCb+
         epVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=;
        fh=c044dLTGNhSMxfJOjIarziMjU0qpVr2pMkMJhB9oadA=;
        b=B0qZmS/z7a/4/1O8xCyGbK0IRiL4/kn0WBQSd+kI0Ek6Kojxvlaj1K21LXE4EU1LYL
         QHx+ZMVg35ZmUoXkwd8a+mL3H4ZzDEZW61ETot45J0htaO3iyMK+QfNO9bw/aVS79lS+
         QF46tRTulhCeJvrUYfwEPxeP3Wbh2lP/819/Qzkz2DdR0xVPb4Cs+FIZTYuZWp9L7Nlp
         L4VF5pJtW/wuhzkSjdaW9ra7yB15w+85BcNxiT7q+gMRYmp2t+eiJU+76SpjvMjLFqli
         wv3N05JO3X+ZNud/rhwBtAeFZ9zp/ff8DUyD0JL0tR7vgF1CsiX5Y2rny05z7RMewq62
         iXYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769071861; x=1769676661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=;
        b=Uy1sT0aI12L+b+0IsHKb9kw53P0T9i4/oB2g6HJ9BYUfuvNRNYje1tbOQ747x9swTc
         YQ3B57RCXX5I3J/XfEoWmDlUgMQD6ijgKfw1G7IpRZVzn5IE5gOWVCAHnRmCSnu3evTH
         NjX5weF93sDoZFCrbms/qM66xxXHrt7oogndE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071861; x=1769676661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=;
        b=R+hGy2WTc+nENnG9NpSktycZ9KFsx63YK7e3s5+9iBZhVFjEAabp7bc2rinzJH8rtE
         NVCxzVmsZ/m2w/bfRCfwycQHQwsM3Gam5j0NH7U6gu4TdhqvTj8fYylUqkjaBeW897Pu
         0btz7w6ht+CkHKASo+lh09cPRLWjZ/RUrL5GS/QhaTkXwDvxXMTSPVD3jJ4seDiUuUpV
         18Tpmk3Lu7QLx2aKTihICEZlu/AeERrKPiQoMeYx92anp19wQqR05MMOXtPPOi8Wg0gJ
         8mwjbzWTrUp6wffuR7ZGb8zH9FJnCpiDjcNWf5xK4Pa1hWilLGWN8SWMkjg1auBgrgfd
         BfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNDxE9FcaGLuLWAIjOIUJHcfO8Uarbwft0CByKnldMiXp3zpT8iHPrBhsnBQvkkY3Xhr3Vr4+OOF5RuvlrTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysqaOGu/ENd3x5BgpVH4UkuBl67tUNhWdodJ6+MmuvRngoTidG
	3n2MThtYz1+89NVK1xKs934LIpzso0gdXNyvtiZsmlhTpMSbTLsUmU1Aa1XpBGgqtY67eowUawG
	gLH1ZwxH7k7AsxxDgbpTmNc4Q4dqa0D4W6vc+nsNk
X-Gm-Gg: AZuq6aKGoCW2GS/VERurtn+VM8jPmoEY2Jjc+Diupd0Ggkj2f+LOn3PuiEQCsibEgjX
	cZryGyKXb1BGBbSNgPvmpiNf0v8RjFQ5NwWKmRAWQpmWFJ/h8VLsfoK/d1QIBog9zjKWsiTO7j5
	Yk30vIBm+l9ztx8FPrv9o3viMSwgd3Q47bLl3INciYkrTwGL61YYGaGB866E2PKkfyQENnGyoiF
	fFJg+ydBXKjb8XohZXbqHyeR21S4Em/YnbTa2BFcqid8N87blVEH/rs9JuFBgeCu7ViVda8dpeE
	t84cy6/NzMIoQDIATXTX2Mee
X-Received: by 2002:a05:6512:b0d:b0:59b:71f4:3de9 with SMTP id
 2adb3069b0e04-59baef00149mr6980941e87.39.1769071860888; Thu, 22 Jan 2026
 00:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20260112110755.2435899-1-tzungbi@kernel.org>
In-Reply-To: <20260112110755.2435899-1-tzungbi@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 22 Jan 2026 16:50:49 +0800
X-Gm-Features: AZwV_Qg5dxj_2w51xU5BsupL9WV0BUnu7Ybn-tnvwj0lQPJsdFVmHAfqqHMP6iE
Message-ID: <CAGXv+5GDd44NDv2WWhpUsjsE7QnjjsmJDii-qSG-VuX6hHgJGg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Break lock dependency to `prepare_lock`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_005103_150599_C36EABD7 
X-CRM114-Status: GOOD (  19.26  )
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

On Mon, Jan 12, 2026 at 7:08=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> A potential circular locking dependency (ABBA deadlock) exists between
> `ec_dev->lock` and the clock framework's `prepare_lock`.
>
> The first order (A -> B) occurs when scp_ipi_send() is called while
> `ec_dev->lock` is held (e.g., within cros_ec_cmd_xfer()):
> 1. cros_ec_cmd_xfer() acquires `ec_dev->lock` and calls scp_ipi_send().
> 2. scp_ipi_send() calls clk_prepare_enable(), which acquires
>    `prepare_lock`.
> See #0 in the following example calling trace.
> (Lock Order: `ec_dev->lock` -> `prepare_lock`)
>
> The reverse order (B -> A) is more complex and has been observed
> (learned) by lockdep.  It involves the clock prepare operation
> triggering power domain changes, which then propagates through sysfs
> and power supply uevents, eventually calling back into the ChromeOS EC
> driver and attempting to acquire `ec_dev->lock`:
> 1. Something calls clk_prepare(), which acquires `prepare_lock`.  It
>    then triggers genpd operations like genpd_runtime_resume(), which
>    takes `&genpd->mlock`.
> 2. Power domain changes can trigger regulator changes; regulator
>    changes can then trigger device link changes; device link changes
>    can then trigger sysfs changes.  Eventually, power_supply_uevent()
>    is called.
> 3. This leads to calls like cros_usbpd_charger_get_prop(), which calls
>    cros_ec_cmd_xfer_status(), which then attempts to acquire
>    `ec_dev->lock`.
> See #1 ~ #6 in the following example calling trace.
> (Lock Order: `prepare_lock` -> `&genpd->mlock` -> ... -> `&ec_dev->lock`)
>
> Move the clk_prepare()/clk_unprepare() operations for `scp->clk` to the
> remoteproc prepare()/unprepare() callbacks.  This ensures `prepare_lock`
> is only acquired in prepare()/unprepare() callbacks.  Since
> `ec_dev->lock` is not involved in the callbacks, the dependency loop is
> broken.
>
> This means the clock is always "prepared" when the SCP is running.  The
> prolonged "prepared time" for the clock should be acceptable as SCP is
> designed to be a very power efficient processor.  The power consumption
> impact can be negligible.
>
> A simplified calling trace reported by lockdep:
> > -> #6 (&ec_dev->lock)
> >        cros_ec_cmd_xfer
> >        cros_ec_cmd_xfer_status
> >        cros_usbpd_charger_get_port_status
> >        cros_usbpd_charger_get_prop
> >        power_supply_get_property
> >        power_supply_show_property
> >        power_supply_uevent
> >        dev_uevent
> >        uevent_show
> >        dev_attr_show
> >        sysfs_kf_seq_show
> >        kernfs_seq_show
> > -> #5 (kn->active#2)
> >        kernfs_drain
> >        __kernfs_remove
> >        kernfs_remove_by_name_ns
> >        sysfs_remove_file_ns
> >        device_del
> >        __device_link_del
> >        device_links_driver_bound
> > -> #4 (device_links_lock)
> >        device_link_remove
> >        _regulator_put
> >        regulator_put
> > -> #3 (regulator_list_mutex)
> >        regulator_lock_dependent
> >        regulator_disable
> >        scpsys_power_off
> >        _genpd_power_off
> >        genpd_power_off
> > -> #2 (&genpd->mlock/1)
> >        genpd_add_subdomain
> >        pm_genpd_add_subdomain
> >        scpsys_add_subdomain
> >        scpsys_probe
> > -> #1 (&genpd->mlock)
> >        genpd_runtime_resume
> >        __rpm_callback
> >        rpm_callback
> >        rpm_resume
> >        __pm_runtime_resume
> >        clk_core_prepare
> >        clk_prepare
> > -> #0 (prepare_lock)
> >        clk_prepare
> >        scp_ipi_send
> >        scp_send_ipi
> >        mtk_rpmsg_send
> >        rpmsg_send
> >        cros_ec_pkt_xfer_rpmsg
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 & MT8188 no regressio=
ns

AFAIU this works because the SCP clock is internal MMIO based, and the
prepare op is a no-op; so splitting the clk_prepare() call out helps
to break the dependency while not incurring additional cost.

