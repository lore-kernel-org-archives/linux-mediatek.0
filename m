Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A190ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mKs6GpQeiVSFHYgIcIiKnYZUq2Gc9RwKLa8CmbtFeM=; b=j7Ty4SjsQjxlN67Y6WSms7GZtq
	xFm9ArxI6OfcewwfYjM05LI80oKsF0KPWXPtwtvHheVlDJHpWDmjHbtOOpyMlnTmn7/oEvclpJJhX
	eaRbyXNeT2LcztF/j/Jx7ldBcO/zg3NBbzqwwTRWZkrmATNq/cE/b07qBzlmq8yWB9bNnJkidjoMn
	QIj5y+mLGsnUhLMpuQ5S4nR4ZDMUrm0lP7CmjIVLrgjuz2+dQ2WHIw16ZwkKlFkwyfNT9rfBctslY
	KJRJ0/QeDIPd72GfE5HVkAtJRwYqgk5hya44O77uOG3V2MjVzypxWBxU2l9vLp7l6/6jntvmbhzZe
	bMLye2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfOi-00FtM9-HV; Sun, 23 Oct 2022 18:08:32 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfOX-00FtIJ-4j; Sun, 23 Oct 2022 18:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666548455;
	bh=jJMuc9hlxKrAfgPz6LPixoJQtBtaekfiWlfI/7cKJlw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a6MOhQzC0GIhV/8YoFvM8/3WSFxPl1pZUnFZn6ghJf0yEYZHYc1i28/5Z5F1CZ3mi
	 wQUYksYu1f0NYtnev+I+LRhIP3lvKzcvV/sJmqK8rUR1qEx4gexyGJd3Jkss6Kk47x
	 Pbdekpi/RaWQtr9L45I4cg+Ee+6pEU7CBOU0b8Ek=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.234] ([80.245.79.234]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Sun, 23 Oct 2022
 20:07:35 +0200
MIME-Version: 1.0
Message-ID: <trinity-2cabbf5f-1775-4cfd-9b6c-08e92812e998-1666548455075@3c-app-gmx-bs01>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sam
 Shih <sam.shih@mediatek.com>, Jieyy Yang <jieyy.yang@mediatek.com>
Subject: Aw: [RFC v1 07/12] arm64: dts: mt7986: add pcie related device
 nodes
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Oct 2022 20:07:35 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-ed7d279a-ec3c-41f4-95b3-8480790f82fd-1666105878851@3c-app-gmx-bap38>
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-8-linux@fw-web.de>
 <trinity-ed7d279a-ec3c-41f4-95b3-8480790f82fd-1666105878851@3c-app-gmx-bap38>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:1kM3UUOGhlHc1aqPITut7jmpqLSkc0EIBLDVdZUliRCRT1SM/Z26jdHbIHfq5dhHJRKbX
 7fO/HXKRO0t4WnruZfFBStbT6wPOdodu+S/J1GJIcRzHZEhMAsx4lVQpnos554RTSw7lpozqu33I
 NlstEHUIyw8JlSpk8GVO9pNb7dqfzzZxnyEn9b6+DiOIylPRg4kZtEYo0KcpMhBlB9DCEDFopjsS
 eEmN1h3EziyZq5yiM8FnDIgE4wfHF1nLYS6nOzMszfr9HhXipIo+rHlW80r8yTgPOvozqqrhJHaZ
 B0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lmu9VQUz/n4=:xrO/0ro88OWB2quWJ3NgTQ
 qIbtbnGC27JgRZLzKhEQOFBPjKfG+f7hwayv3Sgrq9s5+lMvHfz5I09OtPYI+AyHEhaDCYZiN
 AktscUmWnEFfSBtnvftR8O8idgGm9Ptyouolu3M4Wv8L2R+fR7JsPVLW+Z3whzliXPD6nlXwE
 enG7D2pVBtwOZzjMXeyx7C4K0kCjhuYOHzPYhtqtll2ru6KSFX2sPzc57AmlNJSkiGxi/riqa
 0eiTaPCKaJ+DeTR9cwrOxukDfXlN3uL5h6wslfC0Cxf6flzWlFYYp2KyG/R7yi18wtYIDSNIi
 xZA+OxWa76Qlo/rmZA8s4RuVHJGXELKbAWJHNQNDOeTFQnUqkVH4YVy/y6nhSzciijbfyRxuA
 xVyOoZ/p5clFHiS5OafPKVy7FMgYAPn7nxtjM/8/8rUO7vxdtisk8NZO/vvgiliw5wSxYpkBD
 BvnlUMh9vhMD5rLRsnYcHBanIV9mX1KMhpC/KjbVsNaJAnZsPN8w96AMiEVBNjfIxqTq1UgKg
 OCKcLAhVtu2d/EDeyprGFGB2VtcS9GuWkh4T/lSrnQnAiKN0NfUdW+Ju4TrfgC3wFv6N94Jar
 0wvIMBojMhrGXS+VFuPWbc+pf2wAcxhnsy+OL6le7cOE7ZDAw0EzIK7h9QJYwxDp4RLQIpHiB
 ZyQPa0kJE8egRgmG6nYxmUpOGVIx4kkGInL+f51HrPl/35K/QIsLLjTaZ9EMRQTKzVdl3Eqam
 8UrfAiQVuns/3G9PxbqJp7qc8/3ZNmPkaoS0y+5FQceeT+h5CX2M5i93HFflRY6o57wjKqJnt
 wruA58iRwL/6CihJ9QQiXiqkO+j19sGMufHf1St5KpPe+klaVxu4OOlQGl03qwd5IpRy2jouP
 MLnvsL9WWkrz18ovUs2ev3DXyEhC/MRIPtbYs64y6oPyandBn//OaBgnzizBgPhu+cCW7jBOQ
 ILHVEmbbcIOkHzLoFLjmIizS3T16NWvxhtxhvD7PT+lWwGn0qSEACx6sKnwWj6/DOkBPRjAa0
 oW6Kf1nxlJxZ6KF1Xb34GBOAsyLbhaNd+/pailXJDrTz4Dh+zke8trZtbTyIX1iSECCVE2DiV
 bTRlbYeYITd/hBtnwB+diXkACGEXZG4ZMOsmsMQTscwjrPD4GEz0o29gkYHrG7EP+patd6bDY
 s4zsnh+YQpS+y/ByqOzrFFhdPXyvFdaI0E87kSE/a4rl8SsysFbO0HDc963SE3KFz6bNgEz5x
 gwLOXBA0r8u5dgpC87P1MkFZiFtcCrxyO/gRysC6bJJtbVYzCG81qticAJp5vIOYHQkveLgRC
 UDjmcIAC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_110821_660049_52BFC39D 
X-CRM114-Status: UNSURE (   5.59  )
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

Hi,

posted dt binding series here:
https://patchwork.kernel.org/project/linux-mediatek/patch/20221023170234.83621-4-linux@fw-web.de/

my dts looks now like this:

		pcie: pcie@11280000 {
			compatible = "mediatek,mt7986-pcie",
				     "mediatek,mt8192-pcie";
			device_type = "pci";
			#address-cells = <3>;
			#size-cells = <2>;
			reg = <0x00 0x11280000 0x00 0x4000>;
			reg-names = "pcie-mac";
			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
			bus-range = <0x00 0xff>;
			ranges = <0x82000000 0x00 0x20000000 0x00
				  0x20000000 0x00 0x10000000>;
			clocks = <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
				 <&infracfg CLK_INFRA_IPCIE_CK>,
				 <&infracfg CLK_INFRA_IPCIER_CK>,
				 <&infracfg CLK_INFRA_IPCIEB_CK>;
			clock-names = "pl_250m", "tl_26m", "peri_26m", "top_133m";
			status = "disabled";

			phys = <&pcie_port PHY_TYPE_PCIE>;
			phy-names = "pcie-phy";

			#interrupt-cells = <1>;
			interrupt-map-mask = <0 0 0 0x7>;
			interrupt-map = <0 0 0 1 &pcie_intc 0>,
					<0 0 0 2 &pcie_intc 1>,
					<0 0 0 3 &pcie_intc 2>,
					<0 0 0 4 &pcie_intc 3>;
			pcie_intc: interrupt-controller {
				#address-cells = <0>;
				#interrupt-cells = <1>;
				interrupt-controller;
			};
		};


will post v2 soon if this is ok...

regards Frank

