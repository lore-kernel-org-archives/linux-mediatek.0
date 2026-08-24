Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42648C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Date:Cc:To:From:MIME-Version:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/rpMCJfGm+xUSp3I6jJkmErPbYp+urUEQMWu8yYzcE=; b=XMEMxwEa8JH1xSy/6kPmGOonxR
	pVWgO6qY46Hw1ryhB963fY0ZJSRTo6r9sl6C5pAYcapP057wMB2zp3VtDDeGg3YC3P/Ba5ZqP8tX2
	0Zsq2ZgTjKY28C0yORlbtYolJfSPCRkC2u1ciacYrPdfNzbNKLtskNeTqVvf+yqC6EoRrFOelb7hu
	76ROL6i5+cLAo/BBzb4sR0wtzeIctlYCoSGfL4ITmxJa1wbJFvlhV86lMfwbGXavJnakaTvt2Zu9t
	HUXHQC30tIzEYrY22QMdlVZq+oLjpz4TA2MEkh3YvjYNQcEwAvKAVW8d+rvrsJ/q4420NJF8PBXIb
	9CHt0FAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZCX-0000000HEov-26zg;
	Mon, 24 Aug 2026 18:15:20 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZCV-0000000HEnv-0x7T
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 18:15:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4162841a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 11:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787595314; x=1788200114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/rpMCJfGm+xUSp3I6jJkmErPbYp+urUEQMWu8yYzcE=;
        b=nKx7WDb7QdMn3dZi1EO9nQK+e4dcP3UbrQ/Fqb5Aiy+Wu3wAvLenyXwAW5JPjWOIs2
         Mhl4hUwgVWoBVCukv8jApTrFdD6dIb+OE+AQn8zN6x01iWtKhic9VVHBxdqZ+9drICCD
         ad2gtJNA124/HsW9eAWK/r12jGpkvc4GYFzj5SP+KsM12s/WpNNKF2pm3qJBQvzDc0SN
         gjBr6RCuYp7WtVD6ew58JycBSjdojRRC24sZ3e5QUCMsvy6pOoYNC2LbO1c0bdNRatEG
         Jdg95FWzGY4W+mab2EWX3gJHHmr7QRQELcceRFkRbFf3wITNzQyu4R2/DkDBnUvczvry
         xXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787595314; x=1788200114;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d/rpMCJfGm+xUSp3I6jJkmErPbYp+urUEQMWu8yYzcE=;
        b=NNpT9+qehPdvkNvahB0BmvhLvkVGXfTl6/9kQmC/hLUyIxAFkLDTf5XdBqGHYxRRe5
         1u+Z9n98gm1kmDGpqwFiWTgF+P+VT6omaEe+HKdUCfBYK+VoS2WTTCmcB5xUYHdG7nA1
         TrMx+rge/rJMHRyQD83EZIlrGhoSFso8WFFuVo4iMrcYtoLnnbaupGAXtQSF203L/l8k
         E5vTK7Xcwcw6oTkE40xIKSZXq8Fud4aOwBojpxG4ndlLj1F9KUsR7UHQwOcTm9Fw87o3
         nYTKGsX6Wd3r22C6EMt1lCo4lqQ25HagIE1e6dLVZ5VngOsj7xLlW66uvfVLP5BwB30k
         2J6A==
X-Forwarded-Encrypted: i=1; AHgh+RrEeXAs73C/Mk1vSMCgUJ4ikGwNhzU2sYzEJrjq+62IfVuxl+EfZ5tiZP9Wun77uicA/J6cm+9vHoeixQdXtg==@lists.infradead.org
X-Gm-Message-State: AFuF++kj/OUfgJvtxETIRbWJCEcc1Z2gb3QessPDwGgD+oymYmNdRkvx
	EJg4q4D+xoz+x7obLuqu9DECIoPK4T2E12dBnz5F7BIXdK1W8h0C/unCXM5OY+eS
X-Gm-Gg: AR+sD10entDlAVP2r0InmjO/zGEokJSu5Q1n/8y3amcCB095jGxptM8XzfVvBitOeSy
	jv03z/BcWybhB5HyvmF7NcocAXGOJcCNoAsJcMViCBxCegD2j9yCXPMy+EqPWyByI/xuaboY2s8
	ZGODxWEOscryGfaxT4ygi9yVDbCVJFXGBGasU+hJgQ/boARwX9xempyRpaB29jk1ZNViy6PqOvQ
	fx0qLFiQtIuBMYosNzwNytSmlLpHPvqtrdHuAilkrVz17Wffu9t3hhb02nF2fsrlIbRkBwCS5uk
	M5Lol5CgFz/FaOxn54nDJeni6iFsHdHhy8Qd+JzZs7KQc0gTIXKSOk1O3x1CJ9KqwNoaql5DoWc
	ftWMVW/TlO0vv14nwbTp2guuQT4Ha2rdZ/CgoU2t0kTT/ndC/HgUFV+GU6te+fnK5tKwRjFAjoa
	u8wrw6UMJI55awiauE1rfu4PMd3gsY2heLBDakjxNtPwX0rMAqPPxlYWdFfksshWL9vW8q5546n
	GjR2VpNNnnKpwhOIyJOa8IpymaffrseyasQyuS4aZznAqWs2bhmwaRplg==
X-Received: by 2002:a17:90b:3a4b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39646308515mr1602252a91.1.1787595313785;
        Mon, 24 Aug 2026 11:15:13 -0700 (PDT)
Received: from manush ([2406:7400:94:a5e3:4d43:ded5:1c68:7d38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ef75esm26716169c88.7.2026.08.24.11.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:15:13 -0700 (PDT)
Message-ID: <6a8c8a31.ee10049a.195cf8.c6da@mx.google.com>
X-Mailer: git-send-email-equivalent-ps1
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Markus.Elfring@web.de
Date: 24 Aug 2026 23:45:12 +0530
Subject: [PATCH v3] mailbox: mtk-cmdq: fix runtime PM usage counter leak in
 cmdq_mbox_flush
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_111515_271660_9B419C07 
X-CRM114-Status: UNSURE (   7.90  )
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

cmdq_mbox_flush() calls pm_runtime_get_sync() and returns its err=
or=0D=0Acode directly on failure. Per Documentation/power/runtime=
_pm.rst,=0D=0Apm_runtime_get_sync() does not drop the usage count=
er on error, so the=0D=0Acaller is expected to release the refere=
nce itself. The early return=0D=0Ahere skipped that, leaking a ru=
ntime PM usage count on cmdq->mbox.dev=0D=0Aon every failed resum=
e. v2 fixed this by switching to=0D=0Apm_runtime_resume_and_get()=
, which performs the get-and-put=0D=0Ainternally on failure.=0D=0A=
=0D=0AMarkus Elfring additionally pointed out that the "out:" and=
 "wait:"=0D=0Alabels duplicate the same pm_runtime_mark_last_busy=
() +=0D=0Apm_runtime_put_autosuspend() + return sequence. That du=
plication=0D=0Ahides a second, separate leak: the "wait:" path's =
timeout branch=0D=0A(readl_poll_timeout_atomic() failing) returns=
 -EFAULT directly,=0D=0Awithout ever calling pm_runtime_mark_last=
_busy() /=0D=0Apm_runtime_put_autosuspend(), so the pm_runtime re=
ference taken at=0D=0Afunction entry is leaked on every polling t=
imeout too.=0D=0A=0D=0AFix both by merging the two exit sequences=
 into one common "out_pm:"=0D=0Alabel reached by both "out:" and =
"wait:", using "ret" to carry the=0D=0Areturn value. "ret" is exp=
licitly reset to 0 on both success paths=0D=0Abefore reaching "ou=
t_pm:", since pm_runtime_resume_and_get() can=0D=0Areturn a posit=
ive value (e.g. 1) on success, not just 0, and that=0D=0Astale va=
lue must not leak into the function's return value.=0D=0A=0D=0ASi=
gned-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A---=
=0D=0Av3: Fix the pm_runtime leak on the "wait:" timeout path fou=
nd while=0D=0A    addressing Markus Elfring's duplicate-code comm=
ent, by merging=0D=0A    the "out:" and "wait:" exit sequences in=
to a single "out_pm:"=0D=0A    label. Add Matthias Brugger and An=
geloGioacchino Del Regno plus=0D=0A    the linux-mediatek and lin=
ux-arm-kernel lists to Cc, per=0D=0A    MAINTAINERS' "ARM/Mediate=
k SoC support" entry (matches any=0D=0A    drivers/mailbox/mtk-*.=
c filename), per Markus Elfring's review.=0D=0Av2: Use pm_runtime=
_resume_and_get() instead of pm_runtime_get_sync()=0D=0A    plus =
a manual pm_runtime_put_noidle() on the error path, per=0D=0A    =
Markus Elfring's review.=0D=0A=0D=0A drivers/mailbox/mtk-cmdq-mai=
lbox.c | 15 +++++++--------=0D=0A 1 file changed, 7 insertions(+)=
, 8 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/mailbox/mtk-cmdq=
-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c=0D=0Aindex e523c8=
4b4..d4e5f6a7b 100644=0D=0A--- a/drivers/mailbox/mtk-cmdq-mailbox=
.c=0D=0A+++ b/drivers/mailbox/mtk-cmdq-mailbox.c=0D=0A@@ -565,7 +=
565,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsig=
ned long timeout)=0D=0A 	int ret;=0D=0A=0D=0A-	ret =3D pm_runtime=
_get_sync(cmdq->mbox.dev);=0D=0A+	ret =3D pm_runtime_resume_and_g=
et(cmdq->mbox.dev);=0D=0A 	if (ret < 0)=0D=0A 		return ret;=0D=0A=
=0D=0A@@ -590,22 +590,21 @@ static int cmdq_mbox_flush(struct mbo=
x_chan *chan, unsigned long timeout)=0D=0A 	cmdq_thread_disable(c=
mdq, thread);=0D=0A=0D=0A out:=0D=0A 	spin_unlock_irqrestore(&thr=
ead->chan->lock, flags);=0D=0A-	pm_runtime_mark_last_busy(cmdq->m=
box.dev);=0D=0A-	pm_runtime_put_autosuspend(cmdq->mbox.dev);=0D=0A=
-=0D=0A-	return 0;=0D=0A+	ret =3D 0;=0D=0A+	goto out_pm;=0D=0A=0D=0A=
 wait:=0D=0A 	cmdq_thread_resume(thread);=0D=0A 	spin_unlock_irqr=
estore(&thread->chan->lock, flags);=0D=0A+	ret =3D 0;=0D=0A 	if (=
readl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,=0D=0A=
 				      enable, enable =3D=3D 0, 1, timeout)) {=0D=0A 		dev_er=
r(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",=0D=0A 		=
	(u32)(thread->base - cmdq->base));=0D=0A-=0D=0A-		return -EFAULT=
;=0D=0A+		ret =3D -EFAULT;=0D=0A 	}=0D=0A+=0D=0A+out_pm:=0D=0A 	p=
m_runtime_mark_last_busy(cmdq->mbox.dev);=0D=0A 	pm_runtime_put_a=
utosuspend(cmdq->mbox.dev);=0D=0A-	return 0;=0D=0A+	return ret;=0D=0A=
 }=0D=0A--=0D=0A2.46.2.windows.1


