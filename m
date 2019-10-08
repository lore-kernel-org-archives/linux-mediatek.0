From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/4] ASoC: mt8183: fix audio playback slowly after
 playback during bootup
Date: Tue, 8 Oct 2019 13:11:35 +0100
Message-ID: <20191008121135.GH4382@sirena.co.uk>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454874288407044750=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com, lgirdwood@gmail.com, perex@perex.cz, tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, eason.yen@mediatek.com, wim@linux-watchdog.org, linux@roeck-us.net
List-Id: linux-mediatek@lists.infradead.org


--===============0454874288407044750==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline


--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 06:31:57PM +0800, Jiaxin Yu wrote:

> +	rstc = devm_reset_control_get(dev, "audiosys");
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		dev_err(dev, "could not get audiosys reset:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_reset(rstc);
> +	if (ret) {
> +		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
> +		return ret;
> +	}

This means that we're going to be incompatible with old DT bindings that
don't specify a reset controller.  I don't know how widely used these
bindings are so we may be able to get away with this and I'll apply but
we shouldn't be doing it, the code might need to be fixed to make this
optional if people complain.

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cfPYACgkQJNaLcl1U
h9C3vQgAgs/NciVNbX5yhkOJpscZQdjIcphQ+vTFVbzD6Lve7ubMPRDHKDTnJis5
SBzLgKfpjz+jOKtQaLf43hbnbt3ysqb6OtPbksAhTWkP6Ba8haD/hl8rgpdgQmqr
g+O2wiaiqRa2TsSL7A325WO+UBSPfbMabkWPF0MAtZWXclvUY8PSt8TixhP7DRIX
ryvcXlv51QVrRxIyNG/oSSKw6+wqNco5t894qo6Ca6I277zpR5f9gtEt19sqiqW9
pKGSu3ma/B9i7uEmrpytoBfPGdl+65X1DQq1DRb1A7D5phUuSKeFwQidnptm2Phr
0C6SxsX4Y3qTydnI7JMV241vAHiuGQ==
=JJJV
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--


--===============0454874288407044750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0454874288407044750==--
