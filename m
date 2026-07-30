Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A549C54FD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=; b=ciZUs+TCijg1OYbcHYyQkcnHQq
	yeyTfgJLXdlwVqi1HEqzYgnS/MXtoUMD5K3jfKlVq39peU7rTf6rhPLRX/rIEIYpuRR7nbxYRF1I2
	dj1go3rX4ZsF6NamAcKF09UUlrcRcDEDBVkHjf2EEzv3nw4jXwuII3YmzZsx23Qyp4hmrYLOrYDTo
	QCY48gUtQxIuiOmg9pNsaH/kO2uF2gmiVNjI/GCxORv978DBlhEKo2qxXcHcU7pk7v4livdJuh4ID
	dPN9IkB1sk/l5bM33dWVMMEYmml2XnMKuN26TodZqZiYnRRX9JJW3T7Ctj6wsSwC1JrC+Drt9PtWn
	DGNkJhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOH6-0000000AGNy-0hK2;
	Thu, 30 Jul 2026 10:46:04 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOH0-0000000AGM9-35gK
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 10:46:02 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-4472500e25fso842245fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 03:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785408356; cv=none;
        d=google.com; s=arc-20260327;
        b=q/wE4IaEFgfi2HtuaxKDE3iElflhE5h+mu2xKc0JGL4ztcrk9qG7MI4gLM2PM6Bjj3
         cLtO1pHcH5DhtLV3e/MfpLLH4jdAiOfthSHqQXUcI9n//GUvvMp3Od2fy7V+flqH13lj
         dnMSpVGY62WmxKhyMEqTxgbi4ia+M+RRLqvDdsVqgnN8THHUVBvIBL1nov8B8j9VLyJr
         gLU74O0SpPXbEUm43JBWRj44UnPfcggR0DWCTqnThwiMg6fXU1IA8Nl3F9/068RYINa7
         T76gSlCoPSxsURKNEH/PUumqjijCg5sAJ6bYHfd5At48LuQrO17YSjVPURC7dPgbcXGP
         qsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=;
        fh=DUxv2jZLCaoIht0IcgMJml0iN/JZ7vm/Kl47vY1Zo9U=;
        b=gOWuXeH7W7pLi2LCHd8vKZm/cfq+JSWqM+YxmXT7D9prCScaWyzIpLNjk9Raw4T4Zv
         fPHXzo/RubD/BrGz3eQbeDbobLSaMgfvhmrfd9lKgEY+6IWmnu7mtCVFN5JiJJ7Umzdt
         mXRt0tQXxAncTA8XWHMpx8JUZ1Vr6+J0ivqrr9sFor3vYoZki4Mx6z2u8iuM+185hc+M
         NX0eJdw9fdTD53TVzk3cVhUjFxmhTk8yMumwELuxc078oxZ9NM9JBAhXSnrEowtlobT6
         uzC9C61Mj9rVG/Tqpp+OtSb9fXV31GbNuuI1TSofkO+yMxc986QszY8quX7nmH27Ho8q
         lZlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408356; x=1786013156; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=;
        b=gr/TY8TT2xPGkSFcgHpqpNGScYzdbEkmM5cum0tLozcMTZ5Ktk0Uvg3LSKHLkIY2dc
         Vfmi+gR7M4F4O2ON9NyZXFZ9MtAluB0GaxX9IHC5xL4SuGZiSXbY8f9pO0A4WczPXDzW
         cEQAbFhGMMC+0xq6Z3mCXahRV8edjeFKKfQCCKcVibkykAn2O7LvS/s9FiQSTwCHPknG
         9vatTN0bJHjAkZsNqE3zmbXTqrNaUw75cbv8P2b6AEY4dQaVcSIsl1JZvLzBrGUlmTdG
         7Xx3YRksb9kCQye8yGLgaFaMTLIbluObcglxadnBbxc83GBloXqqzNzsyEIzmtBQ2sF7
         asuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408356; x=1786013156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuRHbIkmSMaFWb8LZmF2c4LfdvenqBLwTyvnnrouf6A=;
        b=QNt83c7IP6kCUyJfxKdUKWiurPJAWooNCptJX4Vy3UnJK8hmPw1RX1f1zCnG61g9YL
         fGJ6u6bpLO2cADzr+Rz00S7V4xzJaeh3eRPnal3gWCzz78zA7fim6edcUkvKIv2fxFj6
         R5HlVSy4fvybjySCIbN1jhVKWvvECMKIe+vkA694Tb6WsiRMYbHpkbFoij5Tp7LW7eRm
         4icKKjTaxyneFLOFUyih7RiQ/HYwpASyxtL0hNNhNioKSPDHZrvJApNtVF/gWD92lIij
         HyUhms8p9VqCu+/7cpLdFdarqJ0iXMuXmzQPY7V/5WObz/mNJMqZY0H7KgDvTsXy0bAr
         9HfA==
X-Forwarded-Encrypted: i=1; AHgh+RpkmT9OV56dJqdQTt8H3AFiBAx8pOWJYUU3BWK61vycYCRKTKoDOxMZTruQT0cl9+gRkHNuzH+xyxT+oM6D8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeilkGK0d8qObo7F6DgqnFXdfpZ/TtdbOD0XmB5qfIWV+Dnz3w
	IoUiufBReiimwYsJwXBAJN5tGE+6foJxTECEuJsmjfJuXM1x1zxs1e4ZyFRLrj9ZJW++hBHLNFI
	ySqtTy2NTGEyLABdlr7OM5QyYkzHoPGQ=
X-Gm-Gg: AR+sD12dFfxiUahT0OyRCe5OBUk4paBbAhlA21Kx1YR6lD1Ly0C7RPwC8EXzR71/nBh
	+ZiuZagNrMszJ0mXCmZrTrRYps8ofstS6MXGf1V6VKsrDNbSbEmL+oNIPrMLdnENgi1tWkqnxLL
	srd41AgYUaxmaM5+QPiBPyJlw9FYMG3viVBbT42Xe0M10oalJhiPcLShV8Bh+SoA+V1RCuOEhee
	92AxQUY08hvEAvgGuIdywPU1fqtXeTpYKe3YYHgv7smcXZC/AsnTmbwgQRnx9gtrDNWb3spAy7B
	VtCLJHnab7AsEUJb7ld9FysPUY1qYbbp4Oeh4MlkqYwGvldQQg/tsTgz2j7W3R2J8x2pa/SyEGG
	/kQ==
X-Received: by 2002:a05:6808:13c5:b0:497:e1b7:d7bf with SMTP id
 5614622812f47-4ad8792c413mr1607208b6e.32.1785408356120; Thu, 30 Jul 2026
 03:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com> <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
 <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
 <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com> <CAGXv+5HcwgmEEmhtTU5TpexxRVwDXC-ggdtOViLdmThT7FjB+g@mail.gmail.com>
In-Reply-To: <CAGXv+5HcwgmEEmhtTU5TpexxRVwDXC-ggdtOViLdmThT7FjB+g@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Thu, 30 Jul 2026 19:45:43 +0900
X-Gm-Features: AUfX_mwdD2ZTuptxemrBnMkBWAJZzxtdwPTtYISNfHSIpFsf0WzQLSW0-4D-zDU
Message-ID: <CA+m4KrAK24AY-1xt-VdpuSycM43LwP07euYwgNatmyf=YCwvCQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wens@kernel.org, 
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_034558_839151_31D7A9E9 
X-CRM114-Status: GOOD (  50.65  )
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

Thanks, that matches my understanding as well.

Since the MT8173 enablement patches do not touch the common HWRT/free-list
lifetime code, I agree that this is more likely related to the currently
unsupported GX6250 path.

I am preparing a diagnostic kernel patch to trace all free-list references
during HWRT creation and destruction. I will reproduce the issue again and
send the resulting trace to the Imagination and DRM mailing lists.

Thank you for taking a look.

2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 17:37 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> On Wed, Jul 29, 2026 at 5:35=E2=80=AFPM YoungJoon Lee <getfeus@gmail.com>=
 wrote:
> >
> > Hi Chen-Yu,
> >
> > A follow-up to my previous email.
> >
> > The official v1.1 firmware did fix the original "GPU device lost"
> > problem.
> >
> > The following now works correctly:
> >
> >     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > The driver initializes successfully and detects the PowerVR Rogue
> > GX6250.
> >
> > However, while testing actual rendering, I found another issue which
> > appears to be unrelated to the firmware.
> >
> > Kernel:
> >
> >     Linux 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> >
> > Board:
> >
> >     Google Elm (Acer Chromebook R13 / MT8173)
> >
> > Mesa:
> >
> >     mesa 26.1.5
> >     vulkan-powervr 26.1.5
> >
> > Firmware:
> >
> >     rogue_4.40.2.51_v1.fw
> >     FW version v1.1 (build 6976702 OS)
> >
> > Kernel command line:
> >
> >     powervr.exp_hw_support=3D1
> >
> > Test command:
> >
> >     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
> >
> > Renderer:
> >
> >     GL_RENDERER:
> >     zink Vulkan 1.2
> >     (PowerVR Rogue GX6250)
> >
> > The benchmark progresses normally:
> >
> >     build (VBO off)          212 FPS
> >     build (VBO on)           216 FPS
> >     texture nearest          174 FPS
> >     texture linear           173 FPS
> >     texture mipmap           174 FPS
> >     shading gouraud          165 FPS
> >     shading blinn-phong      135 FPS
> >     shading phong             99 FPS
> >
> > It consistently hangs at:
> >
> >     shading=3Dcel
> >
> > Immediately afterwards the kernel reports:
> >
> >     refcount_t: underflow; use-after-free
> >
> > The first warning is:
> >
> >     pvr_free_list_put()
> >       -> pvr_hwrt_dataset_release()
> >       -> pvr_hwrt_dataset_put()
> >       -> pvr_ioctl_destroy_hwrt_dataset()
> >
> > followed by:
> >
> >     refcount_warn_saturate()
> >
> > Shortly afterwards another kernel Oops occurs:
> >
> >     Unable to handle kernel NULL pointer dereference
> >
> > The second backtrace shows:
> >
> >     pvr_gem_object_create()
> >       -> pvr_fw_object_create()
> >       -> pvr_hwrt_dataset_create()
> >       -> pvr_ioctl_create_hwrt_dataset()
> >
> > The glmark2 process remains as:
> >
> >     glmark2-es2-drm <defunct>
>
> I think this is more related to the unsupported nature of the GX6250,
> and not specific to MT8173. Maybe someone else on the Imagination or
> DRM mailing lists has a better idea of what's going on.
>
>
> ChenYu
>
> > The system is otherwise still reachable through SSH.
> >
> > I collected additional diagnostics, including:
> >
> >     - complete dmesg
> >     - complete kernel journal
> >     - kernel configuration
> >     - PowerVR module information
> >     - userspace package versions
> >     - process/thread state
> >     - runtime PM state
> >     - running Device Tree
> >
> > I can send any of these if they would help.
> >
> > Also, please disregard my previous Tested-by tag for now, since this
> > rendering issue was discovered afterwards.
> >
> > Thank you again for your help.
> >
> > Best regards,
> >
> > YoungJoon Lee
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 13:38 YoungJoon Lee <getf=
eus@gmail.com>:
> > >
> > > Hi Chen-Yu,
> > >
> > > Thank you. Updating the firmware fixed the issue.
> > >
> > > I replaced my previous firmware blob with the official v1.1 firmware:
> > >
> > >   FW version v1.1 (build 6976702 OS)
> > >
> > >   SHA256:
> > >   e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
> > >
> > > After rebooting, the driver loaded the new firmware successfully:
> > >
> > >   powervr 13000000.gpu: [drm] loaded firmware
> > >   powervr/rogue_4.40.2.51_v1.fw
> > >   powervr 13000000.gpu: [drm] FW version v1.1
> > >   (build 6976702 OS)
> > >
> > > I then ran:
> > >
> > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > >
> > > This now completes successfully and detects the PowerVR Rogue GX6250.
> > > The previous "GPU device lost" error no longer occurs.
> > >
> > > So the issue was caused by the older, non-official firmware blob I wa=
s
> > > using, rather than the v4 kernel series or my kernel configuration.
> > >
> > > Thank you for pointing this out, and sorry for the noise.
> > >
> > > Tested-by: YoungJoon Lee <getfeus@gmail.com>
> > >
> > > Best regards,
> > > YoungJoon
> > >
> > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wen=
st@chromium.org>:
> > > >
> > > > On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmai=
l.com> wrote:
> > > > >
> > > > > Hi Chen-Yu,
> > > > >
> > > > > Thank you for posting the v4 series.
> > > > >
> > > > > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > > > > seeing a GPU device loss as soon as Mesa initializes the Vulkan d=
evice.
> > > > >
> > > > > My current setup is:
> > > > >
> > > > >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> > > > >   Kernel:
> > > > >     linux-next next-20260727
> > > > >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> > > > >     (next-20260727-5-g33d6e5134c70)
> > > > >
> > > > >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> > > > >
> > > > >   Mesa: 26.1.5
> > > > >   vulkan-powervr: 26.1.5
> > > > >   Firmware:
> > > > >     rogue_4.40.2.51_v1.fw
> > > > >     SHA256:
> > > > >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d7=
3f2
> > > >
> > > > My firmware blob is different from yours:
> > > >
> > > > powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51=
_v1.fw
> > > > powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
> > > >
> > > > SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e2073=
23e4a
> > > >
> > > > Funny thing is neither of ours match the official firmware blobs re=
leased
> > > > by Imagination [1].
> > > >
> > > > The latest version is "FW version v1.1 (build 6976702 OS)" with
> > > > SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2=
b1c44
> > > >
> > > > This version also works for me.
> > > >
> > > > The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> > > > SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050=
d22f2
> > > >
> > > > And this version also works.
> > > >
> > > > It seems your firmware build is even older than mine. I suggest you
> > > > update it and try again?
> > > >
> > > > [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blo=
b/powervr/powervr/rogue_4.40.2.51_v1.fw
> > > >
> > > >
> > > > > All five patches applied cleanly. The PowerVR driver probes, load=
s the
> > > > > firmware, and creates the DRM render node successfully.
> > > > >
> > > > > However, when I run the following from an SSH session without GDM=
 or
> > > > > another graphical session running:
> > > > >
> > > > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > > > >
> > > > > Mesa prints the expected GX6250 warnings:
> > > > >
> > > > >   Missing reset support for brn51764
> > > > >   Missing reset support for brn58839
> > > > >   Missing support for brn62269
> > > > >
> > > > > The command then hangs, and the kernel reports:
> > > > >
> > > > >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > > > >
> > > > > There are no additional timeout, MMU fault, firmware, clock, or r=
untime
> > > > > PM messages immediately before the device-lost message.
> > > > >
> > > > > I originally also observed the same failure when GDM started GNOM=
E
> > > > > Shell, but reproducing it with vulkaninfo from a non-graphical SS=
H
> > > > > session indicates that this is not specific to Mutter or GNOME.
> > > > >
> > > > > Since your cover letter reports that vkmark and glmark2-es2-drm w=
ork
> > > > > with Mesa 26.1.5, I suspect that there may be a difference in the
> > > > > kernel configuration or another part of the test environment.
> > > > >
> > > > > Could you please share the following details from your working se=
tup?
> > > > >
> > > > >   1. The exact Chromebook board/model used for testing
> > > >
> > > > The codename is "telesu", which is basically a hana in a different =
case.
> > > >
> > > > >   2. The exact kernel base commit
> > > >
> > > > I have a whole bunch of patches on top of next-20260727, but none
> > > > that should affect this.
> > > >
> > > > >   3. The kernel configuration, or at least the relevant DRM, PM,
> > > > >      generic power-domain, IOMMU, and MediaTek clock options
> > > >
> > > > All relevant options are built-in.
> > > >
> > > > >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
> > > >
> > > > Module.
> > > >
> > > > >   5. The firmware SHA256
> > > >
> > > > See above.
> > > >
> > > > >   6. The kernel command line and bootloader used
> > > >
> > > > Chromebook's builtin bootloader.
> > > >
> > > > cmdline:
> > > >
> > > >     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D=
31A
> > > >     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.de=
bug=3D0x106
> > > >     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
> > > >
> > > > AFAICT nothing special.
> > > >
> > > > >   7. Whether `vulkaninfo --summary` also completes successfully
> > > > >
> > > > > My current relevant configuration includes:
> > > > >
> > > > > CONFIG_PM_SLEEP=3Dy
> > > > > CONFIG_PM=3Dy
> > > > > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > > > > CONFIG_MODULES=3Dy
> > > > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > > > CONFIG_DRM_POWERVR=3Dm
> > > > > CONFIG_DRM_MEDIATEK=3Dy
> > > > > CONFIG_SYNC_FILE=3Dy
> > > > > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > > > > CONFIG_IOMMU_SUPPORT=3Dy
> > > > > CONFIG_ARM_SMMU=3Dy
> > > > > CONFIG_MTK_IOMMU=3Dy
> > > > >
> > > > > I would be happy to test additional patches or provide any furthe=
r
> > > > > logs, kernel configuration, or debugging information if that woul=
d
> > > > > help.
> > > >
> > > > As mentioned above, please try updating your firmware blob. Your
> > > > version is even older than mine, and neither of ours is the "offici=
al"
> > > > release.
> > > >
> > > >
> > > > Thanks
> > > > ChenYu
> > > >
> > > >
> > > > > Thanks,
> > > > > YoungJoon Lee
> > > > >
> > > > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchi=
no Del Regno
> > > > > <angelogioacchino.delregno@collabora.com>:
> > > > > >
> > > > > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del=
 Regno
> > > > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > > >>
> > > > > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasn=
ey@redhat.com> wrote:
> > > > > > >>>>
> > > > > > >>>> Hi Chen-Yu,
> > > > > > >>>>
> > > > > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wro=
te:
> > > > > > >>>>> Hi everyone,
> > > > > > >>>>>
> > > > > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > >>>>>
> > > > > > >>>>> This time around Mesa was ready for basic testing, using =
both vulkanmark
> > > > > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > > > > >>>>>
> > > > > > >>>>> Changes since v3 (all in the clk driver patch):
> > > > > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > >>>>> - Added missing of_node_put() in remove function
> > > > > > >>>>>
> > > > > > >>>>> Changes since v2 (all in the clk driver patch):
> > > > > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > >>>>>     - Needed since the driver implements PM domains using=
 the generic PM
> > > > > > >>>>>       domain library, which also depends on PM
> > > > > > >>>>>     - Fixes build breakage (kernel test robot)
> > > > > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > >>>>> - Dropped unused mfg_desc (Brian)
> > > > > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > > > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) b=
ranch
> > > > > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > >>>>>
> > > > > > >>>>> Changes since v1:
> > > > > > >>>>> - Adapted to changed DT bindings
> > > > > > >>>>> - Dropped driver change
> > > > > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > > > > >>>>>
> > > > > > >>>>>
> > > > > > >>>>> This series enables the PowerVR GPU found in the MT8173 S=
oC, found in
> > > > > > >>>>> some Chromebooks.
> > > > > > >>>>
> > > > > > >>>> I'm making a pull for Stephen for the clk changes. Should =
patches 1,2,4
> > > > > > >>>> go through the clk tree? Patches 3,5 go through the DRM tr=
ee?
> > > > > > >>>
> > > > > > >>> Only patches 1 and 2 should go through the clock tree.
> > > > > > >>>
> > > > > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wan=
ts to pick up
> > > > > > >>> DT binding patches. Otherwise I can push patch 3 through dr=
m-misc.
> > > > > > >>>
> > > > > > >>
> > > > > > >> Not sure if I can really take the DRM bindings patch through=
 soc.
> > > > > > >>
> > > > > > >> I will take the devicetree ones exactly right now, even thou=
gh it's going to
> > > > > > >> give warnings.
> > > > > > >>
> > > > > > >> I trust that you'll make the binding get into linux-next bef=
ore it's too late.
> > > > > > >
> > > > > > > Rob beat me to it. :D
> > > > > >
> > > > > > Love it!
> > > > > >
> > > > > > Thanks Rob :-D
> > > > > >
> > > > > > Cheers,
> > > > > > Angelo

