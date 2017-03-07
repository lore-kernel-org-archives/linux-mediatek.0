From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/2] usb: xhci: remove dummy extra_priv_size for size of
 xhci_hcd struct
Date: Tue, 7 Mar 2017 12:02:39 +0100
Message-ID: <20170307110238.GA31069@ulmo.ba.sec>
References: <1488857543-9384-1-git-send-email-chunfeng.yun@mediatek.com>
 <1488857543-9384-2-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5074414573148261415=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488857543-9384-2-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

--===============5074414573148261415==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2017 at 11:32:23AM +0800, Chunfeng Yun wrote:
> because hcd_priv_size is already size of xhci_hcd struct,
> extra_priv_size is not needed anymore for MTK and tegra drivers.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk.c   |    1 -
>  drivers/usb/host/xhci-tegra.c |    1 -
>  2 files changed, 2 deletions(-)

For Tegra:

Tested-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAli+k0oACgkQ3SOs138+
s6HUXg//aewlARvT7iQ8wVFTPGM7jCD8erKeP0s1OzaV6xaoFmR7j6LMRMg+HDWZ
0cqWP6n7mLb7t3H/U/S2dNZSqzUWa9Aeg+uunKlH1FzwaER9yRM9vupS5wivsmv9
6y+mjkITwtzOJ/ES7r83E+vsnjo/nDzXdOU1YQdjEXoAOMizYlpEDGQY4QUEHb2m
7Dh9yxcXLa+m9M+2Kwsbss428MJ4EbUhwTIOMBGeJY6kNBtkdvGAzE7nawOa15zC
ASeMC7HXaSIHSvzMVWQ0EuPSB4p0MZH8Pnk8QkApZ7zvHw+FhFRkgFyB7EvhQuwn
rJh3Ojm28qcwkZHzaw+EFuFZHp3HbdR1ZNuQmndncChLdUvTST0V+s4e1om/ntIV
K0WPKvNWcXtTC9+3ehSq8g4scGh//JtCZapNRxev9nFrIq3px0N9cC/eW3NFPfe6
bBo2z+aoz2zzT9HFvyk143sT7L589JEeeaSwtXpxk+CAeMK61zVAYlY+Vv394pGs
+lm7T+tbp0KvUVIYEQoW3bqfFhMpLwJ9E8Qyhaa00mRAL6wN+InHtL0ZJbujn5MX
D4fMwYaoaNFEjOSvpxgTdb4wLaL3ZdcZngDkZSYlCUIeAtYIxWd/e/wJh2ZK4LdF
9+yVdEsiItOGsZrnqW24vKoYlqDnGH2We+HlY/AyIeG5L1ytFXE=
=goXv
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


--===============5074414573148261415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5074414573148261415==--
