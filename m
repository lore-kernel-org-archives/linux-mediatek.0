Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D33CAC597
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLlllJ5ug9RegIm4nV+laW2lHHBSQZbl1jZbX3LWUyM=; b=1Y5DnibVjHYgv30op3CZTgPIXK
	V24WUrLTydGlgCD+Hwd9p015ZcQzh7A40xdQohMxoL1ga1b+0OGdhy3zG6v1pzRKRX7PGp5x77EVo
	9Vr15KA/955fEL+fv505kt9qUrkYQnNqS0YGRVxxrm+m7iqZEGGTsbyBJKWvwd7KesEykmuqO6CIS
	PLgYLb0kZQ5XRi/c44NeTRLsdFRyHVKHqcZPT2b5CnlYaMjU32woJyOTI7hEPN/hbWy/IAIeO3kj2
	vzilkE03YRA947Xk/ZwYOxCdgU/Lnlq3wshcL5GNdsaJjzo0YQB7xDV2+ee5MS5MSOLwicA0WJquE
	0ZTyU75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxqA-00000007Xmj-3PL5;
	Fri, 12 Sep 2025 07:05:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf1Cx-00000008HTj-3zA4
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 19:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753383735; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JqM7nUSEj8EhZz+dn4qDKcfRd6kX56ADg6GLOiOJyYVA9ev9uwdtFLUZwAe8fSO3pZs59JiaGyhSGdgFS0gBSm8W4Gz15VF1wUN1vVonbX6oqc3sWgbWUTAvbrHBTFEkDxlHriOtSeB8pIVSMOgZqDP1jL2C4YUS9f47PErq97g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753383735; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PLlllJ5ug9RegIm4nV+laW2lHHBSQZbl1jZbX3LWUyM=; 
	b=lnb0b05GTvqldzOKosQYSJEMdE2/cW+gmIU7M1fPorKQOGHAMTNBhrmlRDyJ6QN/N5lcGe9F0sAX32GkpUi7nf9qApCECEV1HkifVw+vfggIpD88zEXRcOY9jnTJ1PxCDZdKiCJIxJzI04CI0k1eLGGG1oSaAFOpY1yGbqIpCK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753383735;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PLlllJ5ug9RegIm4nV+laW2lHHBSQZbl1jZbX3LWUyM=;
	b=Cmk8TRCWgBaG6pYZiqz7Fk7xGJCF+NIX5fg0YAv3RnbAmtWVS9Ti47w77NtMRUjO
	Bmt5UBrU9dA1hgU2/o6v3zKiOHGa392DAJNB2gqi2zsItCFGaQsmmwezxlOiIAdeoz0
	ZKmqcWzbYEovU+OyZV+mWZbx0MwOhBn4HVZqj15s=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1753383732876270.29847959713254; Thu, 24 Jul 2025 12:02:12 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:02:12 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci" <kernelci@lists.linux.dev>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>
Cc: "kernelci-results" <kernelci-results@groups.io>,
	"Laura Nao" <laura.nao@collabora.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Message-ID: <1983dd0867b.208185361696657.4359505113203740161@collabora.com>
In-Reply-To: <175332462466.152.13830549783020660308@ee9f968c8f28>
References: <175332462466.152.13830549783020660308@ee9f968c8f28>
Subject: [KernelCI] mediatek regressions on mainline/master - 01a412d06
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_120224_118854_480A7A87 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 12 Sep 2025 00:05:01 -0700
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

Hello,

KernelCI found some regressions on mtk on mainline master.
I extracted the relevant excerpt below.

Best,

- Gus

--
Gustavo Padovan

Collabora Ltd.



---- On Wed, 23 Jul 2025 23:37:05 -0300 KernelCI bot <bot@kernelci.org> wro=
te ---

 >=20
 >=20
 >=20
 >=20
 > Hello,=20
 > =20
 > Status summary for mainline/master=20
 > =20
 > Dashboard:=20
 > https://d.kernelci.org/c/mainline/master/01a412d06bc5786eb4e44a6c8f0f465=
9bd4c9864/=20
 > =20
 > giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it=20
 > branch: master=20
 > commit hash: 01a412d06bc5786eb4e44a6c8f0f4659bd4c9864=20
 > origin: maestro=20
 > test start time: 2025-07-23 16:36:25.066000+00:00=20
 > =20
 > Builds:       59 =E2=9C=85    0 =E2=9D=8C    0 =E2=9A=A0=EF=B8=8F=20
 > Boots:       196 =E2=9C=85    1 =E2=9D=8C   84 =E2=9A=A0=EF=B8=8F=20
 > Tests:     16320 =E2=9C=85 6781 =E2=9D=8C 3733 =E2=9A=A0=EF=B8=8F=20
 > =20
 > ### POSSIBLE REGRESSIONS=20
 > =20
 > Hardware: mt8195-cherry-tomato-r2=20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97635=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97633=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97632=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97631=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97630=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9762f=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9762e=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master (defconfig+=
lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRES=
S_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97612=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master_jpgdec_1a04=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97611=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master_jpgdec_1a05=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97610=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master_jpgdec_1b04=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760f=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgenc-master (defconfig+=
lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRES=
S_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760e=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgenc-master_jpgenc_1a03=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760d=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgenc-master_jpgenc_1b03=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760c=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000 (defconfig+=
lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRES=
S_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975e4=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000 (def=
config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_=
COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b9=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_vide=
o-codec_10000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=
=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b8=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_vide=
o-codec_2000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=
=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b7=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_vide=
o-codec_25000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=
=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b6=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000 (def=
config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_=
COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b1=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > Hardware: mt8395-genio-1200-evk=20
 > - boot (defconfig+lab-setup+kselftest)=20
 >  last run: https://d.kernelci.org/test/maestro:688116fa2ce2c1874ee911d7=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > =20
 > Sent every day if there were changes in the past 24 hours.=20
 > Legend: =E2=9C=85 PASS   =E2=9D=8C FAIL  =E2=9A=A0=EF=B8=8F INCONCLUSIVE=
=20
 > =20
 > --=20
 > This is an experimental report format. Please send feedback in!=20
 > Talk to us at kernelci@lists.linux.dev=20
 > =20
 > Made with love by the KernelCI team - https://kernelci.org=20
 >=20


